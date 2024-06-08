using System.Collections.Immutable;
using System.Threading.Channels;
using Matches.Application;
using Matches.Application.Models.Match;

namespace Matches.Infrastructure;

public class ChannelProvider : IChannelProvider
{
    private readonly Dictionary<int, Dictionary<string, Channel<State>>> _channels = [];
    private readonly SemaphoreSlim _semaphore = new SemaphoreSlim(1);

    public ImmutableList<ChannelWriter<State>> GetStateChannelWriters(int matchId)
    {
        if (_channels.TryGetValue(matchId, out var channels))
        {
            return channels.Values.Select(c => c.Writer).ToImmutableList();
        }

        return [];
    }

    public async Task<ChannelReader<State>> CreateChannel(int matchId, string channelId)
    {
        try
        {
            await _semaphore.WaitAsync();
            
            var channel = Channel.CreateUnbounded<State>(
                new UnboundedChannelOptions
                {
                    SingleWriter = false,
                    SingleReader = false,
                    AllowSynchronousContinuations = true
                });

            if (_channels.TryGetValue(matchId, out var channels))
            {
                channels[channelId] = channel;
                return channel.Reader;
            }

            _channels[matchId] = new Dictionary<string, Channel<State>>
            {
                { channelId,  channel }
            };

            return channel.Reader;
        }
        finally
        {
            _semaphore.Release();
        }
    }

    public async Task DeleteChannel(int matchId, string channelId)
    {
        try
        {
            await _semaphore.WaitAsync();
            
            if (!_channels.TryGetValue(matchId, out var channels)) return;
        
            if (!channels.TryGetValue(channelId, out var channel)) return;

            channel.Writer.Complete();
            
            channels.Remove(channelId);
        }
        finally
        {
            _semaphore.Release();
        }
    }
}