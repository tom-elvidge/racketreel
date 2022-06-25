namespace RacketReel.Web.Data;

public class MatchService
{
    private readonly HttpClient _httpClient;

    public MatchService(HttpClient httpClient)
    {
        _httpClient = httpClient;
        // todo: get from configuration
        _httpClient.BaseAddress = new Uri("https://localhost:5002/api/v1/matches/");
    }

    public Task<Match[]> GetAllMatchesAsync()
    {
        throw new NotImplementedException();
    }

    public async Task<Match?> GetMatchAsync(int matchId)
    {
        return await _httpClient.GetFromJsonAsync<Match>(matchId.ToString());
    }

    public async Task<State?> GetLatestMatchStateAsync(int matchId)
    {
        return await _httpClient.GetFromJsonAsync<State>(matchId.ToString() + "/states/latest");
    }
}
