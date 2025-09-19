# AddressData frontend

<img src="docs/logo.svg" alt="Description" width="105">

[![Deployment](https://github.com/ashtonav/addressdata-frontend/actions/workflows/addressdata-app-AutoDeployTrigger-1352a65f-b8b9-449e-a5dd-c191984e6a8c.yml/badge.svg)](https://github.com/ashtonav/addressdata-frontend/actions/workflows/addressdata-app-AutoDeployTrigger-1352a65f-b8b9-449e-a5dd-c191984e6a8c.yml)
[![license](https://img.shields.io/github/license/ashtonav/addressdata-frontend.svg)](LICENSE)

This code is used to power [AddressData.net](https://AddressData.net), a site that displays all known addresses by city, alongside an interactive map.

Currently, [AddressData.net](https://AddressData.net) contains millions of addresses for over 1,500 cities around the world.

## Installation

```bash
cd src
docker run -p 8001:8001 -it $(docker build -q .)
```

It may take 10 minutes or more for docker build to be completed.  Afterward, the website can be accessed at http://localhost:8001

## Acknowledgments

- **Datasette**:  
  [Datasette](https://docs.datasette.io/en/stable/) is used to display CSV data on a website. It offers a lightweight, flexible way to query and visualize structured data, making it easier to explore and share the address information we collect.

## Contributing

Pull requests are accepted.

## License

[MIT](https://choosealicense.com/licenses/mit/)
