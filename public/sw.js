// app/public/sw.js

// キャッシュ名とキャッシュするファイルのリスト
const CACHE_NAME = "v1";
const urlsToCache = ["/"];

// インストールイベント
self.addEventListener("install", (event) => {
  // キャッシュのインストール処理
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(urlsToCache);
    }),
  );
});

// フェッチイベント - リクエストがキャッシュにあるか確認
self.addEventListener("fetch", (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      // キャッシュがあればキャッシュを返し、なければネットワークリクエストを行う
      return response || fetch(event.request);
    }),
  );
});

// キャッシュの更新
self.addEventListener("activate", (event) => {
  const cacheWhitelist = [CACHE_NAME];
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        }),
      );
    }),
  );
});
