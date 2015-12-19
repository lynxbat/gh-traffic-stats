# Github traffic grabber

This ruby thing will grab github traffic stats for your favorite repository.
You must have the appropriate ownership for the repo.

It uses a conbination of Capybara, Poltergeist, PhantomJS, and other assort pieces.

You will need to have phantomjs installed in your PATH to run this.

TODO:

1. Add a dockerfile for this
2. Add a small backend thing like sqlite or something to help keep historical data.


You should:

1. Use as you want
2. Be paying Github for service
3. Possibly submit PRs to change this into something more broadly useful

Right now this will either print the json output or ruby pretty inspect of a parsed hash.
The json is so you can just wrap this with another prog.

My guess is these details will eventually land in a proper Github API for paying users. I am a paying user and using this as a stop gap.

## Example fo running:

```ruby
./gh-traffic.rb -u lynxbat -p TUNAFISH -o intelsdi-x -r snap -j
```

Output - first line
```json
{"counts"=>[{"bucket"=>1450483200, "total"=>94, "unique"=>29}, {"bucket"=>1450396800, "total"=>413, "unique"=>102}, {"bucket"=>1450310400, "total"=>545, "unique"=>174}, {"bucket"=>1450224000, "total"=>654, "unique"=>163}, {"bucket"=>1450137600, "total"=>738, "unique"=>202}, {"bucket"=>1450051200, "total"=>960, "unique"=>284}, {"bucket"=>1449964800, "total"=>210, "unique"=>102}, {"bucket"=>1449878400, "total"=>334, "unique"=>118}, {"bucket"=>1449792000, "total"=>1244, "unique"=>400}, {"bucket"=>1449705600, "total"=>4629, "unique"=>2236}, {"bucket"=>1449619200, "total"=>1856, "unique"=>306}, {"bucket"=>1449532800, "total"=>2137, "unique"=>654}, {"bucket"=>1449446400, "total"=>2943, "unique"=>1009}, {"bucket"=>1449360000, "total"=>594, "unique"=>229}], "summary"=>{"total"=>17351, "unique"=>5474}}
```

Output - second line
```json
{"counts"=>[{"bucket"=>1450483200, "total"=>1, "unique"=>1}, {"bucket"=>1450396800, "total"=>36, "unique"=>15}, {"bucket"=>1450310400, "total"=>30, "unique"=>8}, {"bucket"=>1450224000, "total"=>42, "unique"=>13}, {"bucket"=>1450137600, "total"=>22, "unique"=>9}, {"bucket"=>1450051200, "total"=>5, "unique"=>4}, {"bucket"=>1449964800, "total"=>1, "unique"=>1}, {"bucket"=>1449878400, "total"=>4, "unique"=>1}, {"bucket"=>1449792000, "total"=>25, "unique"=>10}, {"bucket"=>1449705600, "total"=>76, "unique"=>28}, {"bucket"=>1449619200, "total"=>73, "unique"=>16}, {"bucket"=>1449532800, "total"=>101, "unique"=>29}, {"bucket"=>1449446400, "total"=>63, "unique"=>18}, {"bucket"=>1449360000, "total"=>15, "unique"=>1}], "summary"=>{"total"=>494, "unique"=>119}}
```