using System.Collections.Immutable;
using System.Threading.Channels;
using Matches.Application.Models.Match;

namespace Matches.Application;

public interface IChannelProvider
{
    public ImmutableList<ChannelWriter<State>> GetStateChannelWriters(int matchId);
    public Task<ChannelReader<State>> CreateChannel(int matchId, string channelId);
    public Task DeleteChannel(int matchId, string channelId);
}