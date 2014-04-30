AutoHtml.add_filter(:coub).with(:width => 640, :height => 480, :frameborder => 0, :allowfullscreen => true) do |text, options|
  regex = /(http?:\/\/)?(www.)?(coub\.com\/view\/([A-Za-z0-9]*))/
  text.gsub(regex) do
    coub_id = $4
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    allowfullscreen = options[:allowfullscreen]
    src = "http://coub.com/embed/#{coub_id}"
    %{<iframe src="#{src}?muted=false&amp;autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" allowfullscreen="#{allowfullscreen}" frameborder="#{frameborder}" width="#{width}" height="#{height}"></iframe>}
  end
end