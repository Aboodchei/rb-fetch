# `./fetch` 📄
### About
`rb-fetch` is a simple lightweight ruby script that can be invoked using `./fetch --args`.
It downloads webpages as HTML to the project's root folder. It also saves some metadata (when the webpage was last downloaded, number of links, and images), and tries its best to download assets.

### Usage
To use it locally, you need `ruby >= 2.3` (since this code uses the &. operand), and the `nokogiri` gem.
To download Nokogiri, you can use the `gem install nokogiri` command.
You can also build an image using docker, by running `docker-compose build`, and running `docker-compose up`. You can specify the arguments at `docker-compose.yml`

To invoke it, you can use `./fetch --metadata --download_assets https://google.com https://facebook.com https://paypal.com`

The `--metadata` flag displays additional information such as last downloaded at, number of images, and number of links.
The `--download_assets` flag instructs the fetcher to download and cache all JS and image assets, and link to the local version instead, for a full offline experience.

The website's html is saved and is accessible via `{host_name}{request_uri}.html` in the root folder. In case the assets are downloaded, they will be saved and accessible via `assets/{host_name}/{request_uri}/{asset_name}`.
In case there are no request params, for example, `https://google.com`, the `request_uri` is denoted by an underscore `_`

#### Limitations
- Due to the way some websites try to redirect you to `/`, chrome will, unfortunately, redirect you to the root folder of your machine, which is incorrect behavior.
- Due to the Allow-CORS policy, and since we're serving this file locally and not through HTTP/HTTPS, some assets may refuse to load in the first place.
- Assets that are fetched via javascript are not downloaded properly.
- Fonts are not downloaded by the asset downloader.
- The way you need to modify `docker-compose.yml` is not elegant.

#### Thank you for your time!