<script>
    import { onMount } from "svelte";
    import { writable } from "svelte/store";

    // populated from route
    export let id;

    // state
    export const match = writable({});
    export const latestState = writable({});

    const setMatch = (id) => {
        var uri = import.meta.env.VITE_MATCHES_URI + `/api/v1/matches/${id}`;
        fetch(uri)
        .then(response => response.json())
        .then(data => {
            match.set(data["data"]);
        })
        .catch(_ => {
            return [];
        });
    }

    const setLatestState = (id) => {
        var uri = import.meta.env.VITE_MATCHES_URI + `/api/v1/matches/${id}/states/latest`;
        fetch(uri)
        .then(response => response.json())
        .then(data => {
            latestState.set(data["data"]);
        })
        .catch(_ => {
            return [];
        });
    }

    onMount(async () => {
        // fetch data
        setMatch(id);
        setLatestState(id);

        // poll for latest match state every second
        let poller = setInterval(async () => setLatestState(id), 1000);

        // onDestroy lifecycle function clear poller
        return () => clearInterval(poller);
    });
</script>

<main>
    <!-- todo: scoreboard or summary depending on if the match is in progress -->
    {#if $match["players"]}
        <h1>{$match["players"][0]} vs {$match["players"][1]}</h1>
        <h2>{new Date($match["createdDateTime"]).toLocaleString()}</h2>
    {:else}
        <p>Loading match...</p>
    {/if}

    {#if $latestState["score"]}
    <ul>
        <li>{$match["players"][0]}{$latestState["serving"] == $match["players"][0] ? " *" : ""}</li>
        <ul>
            <li>{$latestState["score"][$match["players"][0]]["sets"]}</li>
            <li>{$latestState["score"][$match["players"][0]]["games"]}</li>
            <li>{$latestState["score"][$match["players"][0]]["points"]}</li>
        </ul>
        <li>{$match["players"][1]}{$latestState["serving"] == $match["players"][1] ? " *" : ""}</li>
        <ul>
            <li>{$latestState["score"][$match["players"][1]]["sets"]}</li>
            <li>{$latestState["score"][$match["players"][1]]["games"]}</li>
            <li>{$latestState["score"][$match["players"][1]]["points"]}</li>
        </ul>
    </ul>
    {:else}
        <p>Loading latest state...</p>
    {/if}
</main>