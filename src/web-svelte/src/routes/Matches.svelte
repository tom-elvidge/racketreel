<script>
    import { Link } from "svelte-routing";
    import { onMount } from "svelte";
    import { writable } from "svelte/store";

    // state
    export const matches = writable([]);

    const setMatches = () => {
        var uri = import.meta.env.VITE_MATCHES_URI + `/api/v1/matches`;
        fetch(uri)
        .then(response => response.json())
        .then(data => {
            matches.set(data["data"]);
        })
        .catch(_ => {
            return [];
        });
    }

    function getMatchName(match) {
        return match["players"][0] + " vs " + match["players"][1] + " (" + new Date(match["createdDateTime"]).toLocaleString() + ")";
    }

    onMount(() => {
        // fetch data
        setMatches();
    });
</script>

<main>
    <h1>Matches</h1>
    <p>A list of all the matches...</p>
    <ul>
        <!-- todo: make api sort by created date time -->
        <!-- todo: separate list and presentation for live matches and completed matches-->
        {#each $matches as match}
        <li>
            <Link to="matches/{match["id"]}">{getMatchName(match)}</Link>
        </li>
        {/each}
    </ul>
</main>