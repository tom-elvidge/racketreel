<script>
    import { onMount } from "svelte";
    import { match } from "../store.js";

    // populated from route
    export let id;

    onMount(() => {
        // todo: endpoints from config
        fetch(`https://localhost:5012/api/v1/matches/${id}`)
        .then(response => response.json())
        .then(data => {
            // console.log(data);
            match.set(data["data"]);
        })
        .catch(error => {
            // console.log(error);
            return [];
        });
    });
</script>

<main>
    <!-- todo: scoreboard or summary depending on if the match is in progress -->
    <p>The match id is {id}</p>
    <p>Match started at {$match["createdDateTime"]}</p>
</main>