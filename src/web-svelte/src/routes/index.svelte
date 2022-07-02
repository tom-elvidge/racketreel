<script>
    import { Router, Route } from 'svelte-routing';
    import Home from './Home.svelte';
    import Matches from './Matches.svelte';
    import Match from './Match.svelte';
  
    export let url = '';
  </script>
  
  <Router {url}>
    <div>
      <Route path="/" component={Home} />
      <Route path="matches" component={Matches} />
      <Route path="matches/:id" let:params>
        <Match id="{params.id}" />
      </Route>
    </div>
  </Router>