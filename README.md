# AddressData.net

<img src="docs/logo.svg" alt="AddressData.net logo" width="105">

[![deployment](https://github.com/ashtonav/addressdata.net/actions/workflows/addressdata-app-AutoDeployTrigger-97565f4e-b488-43b4-bd79-af6dc76a766b.yml/badge.svg)](https://github.com/ashtonav/addressdata.net/actions/workflows/addressdata-app-AutoDeployTrigger-97565f4e-b488-43b4-bd79-af6dc76a766b.yml)
[![license](https://img.shields.io/github/license/ashtonav/addressdata.net.svg)](CODE_LICENSE)

This repository contains the source code for [AddressData.net](https://addressdata.net) — a website that displays street addresses by city alongside an interactive map.

- **Self-hosting:** run your own instance; see [Installation](#installation). A self-hosted instance is **functionally identical** to the public site.
- **Coverage:** millions of addresses across 1,500+ cities worldwide.
- **Baked Data:** no external databases or services are required. A read-only SQLite database containing all addresses is bundled inside the Docker image. See: [the “Baked Data” architectural pattern](https://simonwillison.net/2021/Jul/28/baked-data/).

## Screenshots

![Screenshot 1](docs/screenshot-1.png)

![Screenshot 2](docs/screenshot-2.png)

## Installation

### Using Docker (recommended for self-hosting)
1. From the repository root, build and run the container:
   ```bash
   docker build -t addressdatanet ./src
   docker run -it -p 8001:8001 addressdatanet
    ```

2. The website can be accessed at [http://localhost:8001](http://localhost:8001).

> **Note:** The Docker build can take 20 minutes or more to complete.

## Acknowledgments

* **[Datasette](https://datasette.io/):**
* **[Datasette Charcoal Theme](https://github.com/julien040/charcoal-datasette-theme)**

## Contributing

Pull requests are accepted.

## License

* **Code:** [MIT](https://choosealicense.com/licenses/mit/).
* **Data:** Street-address data retrieved using the [AddressData tool](https://github.com/ashtonav/addressdata) includes information from OpenStreetMap. © OpenStreetMap contributors. The data is available under the Open Database License (ODbL) v1.0.