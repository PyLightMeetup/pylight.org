
terraform {
  backend "gcs" {
    bucket  = "pylight-terraform-state"
    path    = "heroku/terraform.tfstate"
    project = "pylight-169718"
  }
}


provider "heroku" {
  email   = "heroku@wuub.net"
}


resource "heroku_app" "pylight-prod" {
  name   = "pylight-prod"
  region = "eu"

  config_vars {
    DJANGO_SETTINGS_MODULE = "pylight.settings.production"
    WEB_CONCURRENCY = "2"
    EMAIL_HOST = "smtp.sendgrid.net"
    EMAIL_PORT = "587"
    EMAIL_USE_TLS = "true"
    EMAIL_HOST_USER = "pylight-prod-heroku"
  }

  buildpacks = [
    "heroku/python"
  ]
}

resource "heroku_addon" "pylight-staging-db" {
  app  = "${heroku_app.pylight-staging.name}"
  plan = "heroku-postgresql:hobby-dev"
}


resource "heroku_app" "pylight-staging" {
  name   = "pylight-staging"
  region = "eu"

  config_vars {
    DJANGO_SETTINGS_MODULE = "pylight.settings.staging"
    WEB_CONCURRENCY = "2"
  }

  buildpacks = [
    "heroku/python"
  ]
}

resource "heroku_addon" "pylight-prod-db" {
  app  = "${heroku_app.pylight-prod.name}"
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_pipeline" "pylight" {
  name = "pylight"
}


resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.pylight-staging.name}"
  pipeline = "${heroku_pipeline.pylight.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.pylight-prod.name}"
  pipeline = "${heroku_pipeline.pylight.id}"
  stage    = "production"
}

resource "heroku_domain" "production" {
  app      = "${heroku_app.pylight-prod.name}"
  hostname = "www.pylight.org"
}

resource "heroku_domain" "production-root" {
  app      = "${heroku_app.pylight-prod.name}"
  hostname = "pylight.org"
}

resource "heroku_domain" "staging" {
  app      = "${heroku_app.pylight-staging.name}"
  hostname = "staging.pylight.org"
}

