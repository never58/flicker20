/*
 Написать программу, показывающую список последних загруженных фотографий на сервис Flickr.

 Приложение состоит из двух экранов:

 На первом экране показываются миниатюры первые 20 фотографий в виде таблички. Каждая фотография должна быть обрезана до квадратного размера.В портрете фотографии должны быть расположены в две колонки и иметь высоту и ширину = 35% от ширины экрана (+10% отступ слева, 10% между и 10% справа). В landscape ориентации фотографии должны быть расположены в 4 колонки и иметь ширину и высоту = 20% (+4% отступы слева, справа и между фотографиями).
 На втором экране должна показываться фотография на весь экран в максимальном разрешении, которое влезает в экран без поворота и обрезания. Второй экран открывается по клику на миниатюру на первом экране.
 Список фотографий надо забирать через Flickr API:

 https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=da9d38d3dee82ec8dda8bb0763bf5d9c&format=json&nojsoncallback=1

 URL фотографии формируется на основе полученного ответа следующим образом:

 https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg

 Список должен отображать 20 последних фотографий, загруженных на Flickr (метод flickr.photos.getRecent)

 В приложении должна быть кнопка обновления, которая обновляет список.

 Программа должна поддерживать обе ориентации (portrait & landscape).

 Приложение должно локально сохранять все загруженные фотографии и работать при отсутствии интернет соединения.

 Общая оценка может быть снижена за нестабильную работу, плохо написанный код или плохо продуманный user interface. Не забывайте про иконку и название приложения и другие важные мелочи.

 Ничего из условия выше не заменит здравого смысла.

 Ограничение по времени:
 На все задание дается 4 часа
 */
