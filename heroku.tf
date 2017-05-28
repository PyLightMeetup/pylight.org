provider "heroku" {
  email   = "heroku@wuub.net"
}


resource "heroku_app" "pylight-prod" {
  name   = "pylight-prod"
  region = "eu"

  config_vars {
    DJANGO_SETTINGS_MODULE = "pywaw.settings.production"
    WEB_CONCURRENCY = "2"
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
    DJANGO_SETTINGS_MODULE = "pywaw.settings.staging"
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




