
default[:mssql]={
  apt: {
    host: "https://packages.microsoft.com",
    key: "/keys/microsoft.asc",
    arch: "amd64",
    distribution: "xenial",
    components: %w(main),
    repos: {
      server: "/ubuntu/16.04/mssql-server-2017",
      tools: "/ubuntu/16.04/prod"
    }
  },
  packages: %w(mssql-server mssql-server-fts),
  broken_packages: %w(mssql-tools unixodbc-dev),
  password: 'Vagrant1!',
  pid: 'Developer',
  users: %w(vagrant)
}

