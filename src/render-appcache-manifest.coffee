module.exports = (data) ->
  data.cache = [] unless data.cache
  data.network = [] unless data.network
  data.fallback = {} unless data.fallback
  data.comments = [] unless data.comments
  data.comments.push data.comment if data.comment
  hasComments = data.comments.length > 0 or data.lastModified or data.unique
  lines = []
  lines.push "CACHE MANIFEST"
  lines.push ""
  lines.push entry for entry in data.cache
  if data.network.length > 0
    lines.push ""
    lines.push "NETWORK:"
    lines.push entry for entry in data.network
  if Object.keys(data.fallback).length > 0
    lines.push ""
    lines.push "FALLBACK:"
    lines.push "#{pattern} #{fallback}" for pattern, fallback of data.fallback
  lines.push "" if data.timestamp or data.unique
  lines.push "# #{comment}" for comment in data.comments
  lines.push "# Last modified at #{data.lastModified.toUTCString()}." if data.lastModified
  lines.push "# Math.random() == #{Math.random()}" if data.unique
  lines.join "\n"