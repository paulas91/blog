module AlbumHelper
  def album_cover(album) 
    if album.cover.attached?
      image_tag(album.cover.variant(:thumb))
    else
      image_tag('No_image_available.svg', class: 'no-image')
    end
  end

end
