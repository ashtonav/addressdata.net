# AddressData.net

<img src="docs/logo.svg" alt="Description" width="105">

[![deployment](https://github.com/ashtonav/addressdata.net/actions/workflows/addressdata-app-AutoDeployTrigger-97565f4e-b488-43b4-bd79-af6dc76a766b.yml/badge.svg)](https://github.com/ashtonav/addressdata-frontend/actions/workflows/addressdata-app-AutoDeployTrigger-97565f4e-b488-43b4-bd79-af6dc76a766b.yml)
[![license](https://img.shields.io/github/license/ashtonav/addressdata.net.svg)](LICENSE)

This code is used to power [AddressData.net](https://AddressData.net), a site that displays all known addresses by city, alongside an interactive map.

Currently, [AddressData.net](https://AddressData.net) contains millions of addresses for over 1,500 cities around the world.

## Installation

### How to run
1. From the root folder of the project, run the following commands:

2. ```bash
   docker build -t addressdatanet ./src
   docker run -it -p 8001:8001 addressdatanet
   ```
2. The API can be accessed at [http://localhost:8001](http://localhost:8001).

FYI: The build script is a bit slow. It may take 20 minutes or more for docker build to be completed. 

## Acknowledgments

- **Datasette**:  
  [Datasette](https://docs.datasette.io/en/stable/) is used to display CSV data on a website. It offers a lightweight, flexible way to query and visualize structured data, making it easier to explore and share the address information we collect.

- **OpenStreetMap**
  This repository includes data extracted from OpenStreetMap (via Overpass API). **Contains information from OpenStreetMap, © OpenStreetMap contributors.** Data is available under the **Open Database License (ODbL) 1.0**.

- **Datasette Charcoal Theme** by https://github.com/julien040/charcoal-datasette-theme.


## Contributing

Pull requests are accepted.

## License

- The code itself is licensed under [MIT](https://choosealicense.com/licenses/mit/).
- The street addresses were retrieved using github.com/ashtonav/addressdata and are licensed/available under **Open Database License (ODbL) 1.0**.