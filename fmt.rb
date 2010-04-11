require 'bluecloth'
require 'rubypants'

src = ARGF.read

src.gsub!(/\b[A-Z]{3,}\b/, '<small>\&</small>')

html = RubyPants.new(BlueCloth.new(src).to_html).to_html

puts <<EOF
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>#{html[%r{<h1>(.*)</h1>}, 1]}</title>
    <style>
body {
  font: 14px/16px Corbel, Lucida Grande, serif;
  background-color: #ffffff;
  color: #000000;
  margin: 2em;
  max-width: 50em;
}

small {
  font-size: 12px;
}

h1 {
  font: 28px/32px Corbel, Lucida Grande, serif;
}

h2 {
  font: bold 16px/32px Corbel, Lucida Grande, serif;
  margin: 20px 0 12px 0;
  padding: 0;
}

p {
  padding: 0;
  margin: 8px 0;
}

ol, ul {
  margin: 0;
  padding: 0;
}

pre, code {
  font: 95% Consolas, Monaco, monospace;
}

pre {
  margin-left: 40px;
}
    </style>
  </head>
  <body>
#{html}
  </body>
</html>
EOF
