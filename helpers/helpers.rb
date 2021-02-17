helpers do
  def render_view(path, options = {})
    erb(path.to_sym, options)
  end

  def render_partial(path, options = {})
    parts = path.to_s.split('/')
    filename = parts.pop
    newpath = [parts, "_#{filename}"].join('/')
    erb(newpath.to_sym, options.merge({ layouts: false }))
  end

  def current_day
    time = Time.now
    time.year + time.yday * 0.001
  end
end
