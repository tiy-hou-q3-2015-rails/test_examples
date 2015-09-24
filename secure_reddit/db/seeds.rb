j = User.create email: "jesse@theironyard.com", password: "12345678"
m = User.create email: "matt@theironyard.com", password: "12345678"
b = User.create email: "brian.dorton@theironyard.com", password: "12345678"

j.links.create url: "http://firefox.com"
j.links.create url: "http://duckduckgo.com"
m.links.create url: "http://react.io"
m.links.create url: "http://farm-to-table.io"
b.links.create url: "http://brianadams.com"
b.links.create url: "http://siphon-coffee.com"


j.follow(b)
