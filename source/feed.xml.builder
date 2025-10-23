xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", "xmlns:content" => "http://purl.org/rss/1.0/modules/content/" do
  xml.channel do
    xml.title site_config["title"]
    xml.link site_config["url"]
    xml.description site_config["description"]
    xml.language "en-us"
    xml.lastBuildDate Time.now.rfc822

    releases.each do |release|
      xml.item do
        xml.title "#{site_config['title']} #{release['version']}"
        xml.link release["magnet_link"] if release["release_url"]
        xml.guid "#{site_config['url']}/releases/#{release['version']}"
        xml.pubDate Date.parse(release["release_date"]).rfc822
        xml.description do
          xml.cdata! %{
            <h3>#{release['filename']}</h3>
            <p><strong>Size:</strong> #{release['size']}</p>
            <p><strong>Notes:</strong> #{release['notes']}</p>
            <p><strong>SHA256:</strong> <code>#{release['sha256']}</code></p>
            <h4>Download Options:</h4>
            <ul>
              #{release['torrent_file'] ? "<li><a href=\"#{site_config['url']}#{release['torrent_file']}\">Download Torrent</a></li>" : ""}
              #{release['magnet_link'] ? "<li><a href=\"#{release['magnet_link']}\">Magnet Link</a></li>" : ""}
              #{release['release_url'] ? "<li><a href=\"#{release['release_url']}\">Changelog</a></li>" : ""}
            </ul>
          }
        end
      end
    end
  end
end
