// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"
import 'bootstrap'

setTimeout(function() {
  document.querySelectorAll("p.alert")[0].style.display = "none";
}, 5000); //