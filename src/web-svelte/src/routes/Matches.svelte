<script>
    import { Link } from "svelte-routing";
    import { onMount } from "svelte";
    import { matches } from "../store.js";

    onMount(() => {
        // todo: endpoints from config
        fetch("https://localhost:5012/api/v1/matches")
        .then(response => response.json())
        .then(data => {
            // console.log(data);
            matches.set(data["data"]);
        })
        .catch(error => {
            // console.log(error);
            return [];
        });
    });
</script>

<main>
    <h1>Matches</h1>
    <p>A list of all the matches...</p>
    <ul>
        <!-- todo: sort by created date time -->
        <!-- todo: separate list and presentation for live matches -->
        {#each $matches as match}
        <li>
            <Link to="matches/{match["id"]}">Match {match["id"]}</Link>
        </li>
        {/each}
    </ul>
</main>