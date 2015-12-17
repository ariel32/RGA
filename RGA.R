require(rga)
# в консоле разработчика добавляем к проекту API GA, а затем разрешаем
# доступ по протоколу OAuth 2.0 для other client

client.id <- "804403534023-eb20cqemun4dv2ltnvni4ana21mv6jf4.apps.googleusercontent.com"
client.secret <- "y34wxfqo8cmtZGxc7FxQeHvP"
rga.open(instance = "ga", client.id, client.secret, where = "ga.rga")
# id вообще получилось извлечь только из этого чудо-сервиса:
# https://ga-dev-tools.appspot.com/query-explorer/
# но потом оказалось, что айди хранится в профиле :) id = ga$getProfiles()$id
# id = "72502756"

id = ga$getProfiles()$id

d <- ga$getData(ids = id,
                      start.date = ga$getFirstDate(id), end.date = Sys.Date(),
                      metrics = "ga:users,ga:sessions,ga:pageviews,ga:visits",
                      dimensions = "ga:date", batch = TRUE)

d <- ga$getData(id, ga$getFirstDate(id), end.date = Sys.Date(),
                metrics = "ga:visits,ga:sessionDuration", dimensions = "ga:date",
                sort = "-ga:date")
