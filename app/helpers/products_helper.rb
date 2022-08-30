module ProductsHelper
  def product_image(product) 
    if product.image.attached?
      image_tag(product.image.variant(:thumb))
    else
      image_tag('No_image_available.svg', class: 'no-image')
    end
  end
end
