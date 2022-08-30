// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
window.process = {
  env: {
      NODE_ENV: 'development'
  }
}   
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"
import "./popper.min"
import 'bootstrap'

setTimeout(function() {
  document.querySelectorAll("p.alert")[0].style.display = "none";
}, 5000); //