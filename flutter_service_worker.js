'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "1764e06eb0a8fb0111d90382d46090b1",
"version.json": "8f4ba40dc85334acb035e82a22a9464a",
"index.html": "cf18b40125cc9586b10ac3f6d70f8f65",
"/": "cf18b40125cc9586b10ac3f6d70f8f65",
"main.dart.js": "7b966aa7f574b3af735754a028d110b3",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "005d3a5b8a61c1cbbd2dd07c9c30ea3f",
"icons/Icon-192.png": "c58659b872c83f49a7f78140e21a2d6c",
"icons/Icon-maskable-192.png": "c58659b872c83f49a7f78140e21a2d6c",
"icons/Icon-maskable-512.png": "9b3b1b9d24a7d20ecb52d496c816da21",
"icons/Icon-512.png": "9b3b1b9d24a7d20ecb52d496c816da21",
"manifest.json": "661d7413bd0b2c17cd8cde37cbe35601",
"assets/AssetManifest.json": "8abb04f01e5aeb8fe7502be7ea1ad3eb",
"assets/NOTICES": "16d1333fe1ec757f15a6f078ba1e135a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "23a33d900fd87fe5d7f69ae76d6f5a71",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "57bcc9efa81c5551d05846caf34ffdd9",
"assets/fonts/MaterialIcons-Regular.otf": "9ebfc6bfa04506ca078a0099895c0174",
"assets/assets/images/illus7.png": "25b7882be60b85a397723181189e3a31",
"assets/assets/images/medium.svg": "9a93ab78f94644731d3240d5f31a6289",
"assets/assets/images/illus6.png": "bcbdd17ebf8f3159d75a98917f736c12",
"assets/assets/images/illus4.png": "693afbadba024b2df83ae9b6526c88e2",
"assets/assets/images/gmail.svg": "07a7fc5a34f985f9a4fea8d3b056aa10",
"assets/assets/images/klout_bg.png": "650ce4bdd4b5cb857090a2e45cd5a42c",
"assets/assets/images/illus5.png": "71b693d4c6ca662d149caa39dbd4c82a",
"assets/assets/images/illus1.png": "eed707be65e82c6865d7821432bb0b20",
"assets/assets/images/dzap_logo.svg": "b548eeee5509d1f59b8620ce221e1f6d",
"assets/assets/images/illus2.png": "6ccb2507ebe2ca63143b4c4cff5a9517",
"assets/assets/images/illus3.png": "2d49196eab4f8b911821b68139f87aff",
"assets/assets/images/klout_logo.svg": "c8dab0d5a40e763ebbd0b1b0104420de",
"assets/assets/images/aparna_chatterjee_logo.svg": "1634343e5fa89cc1edaa9ffe913efe9e",
"assets/assets/images/linkedln.svg": "b49893efa988f9cf0589618118e5eb04",
"assets/assets/images/propel.svg": "a3e939b267d068b61e98e7dc2906f9f0",
"assets/assets/images/me.jpeg": "24c82ab98ddbd868f9ef64d2eb48ec0c",
"assets/assets/images/propel_bg.png": "be8efb963ea7e922708832e662bc4e83",
"assets/assets/images/dzap_bg.svg": "9d7ed7a6f5b54452fa1ae2e5e1d6efe2",
"assets/assets/images/bg.png": "3aaa71bae0330b323baba4ac01fe0c17",
"assets/assets/pdf/aparna_chatterjee.pdf": "3737c4e993dc9cb09bc81e005ef2ffad",
"canvaskit/skwasm.js": "f17a293d422e2c0b3a04962e68236cc2",
"canvaskit/skwasm.js.symbols": "019ce15725b662107018065e47e5e7fc",
"canvaskit/canvaskit.js.symbols": "1975f000d822abd1f269ca742db33e63",
"canvaskit/skwasm.wasm": "dc95323b43faaace3b9fb210bf617b61",
"canvaskit/chromium/canvaskit.js.symbols": "d1f125ac731e83b4e3c69d7acff5b7d0",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.wasm": "dd35c385333b6ab30ab6256c81a2b937",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/canvaskit.wasm": "c109b708145a04614d235f44f08f0c4f",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
".idea/workspace.xml": "2680524bb1cb0c8cbb73455e89a385a3",
".idea/modules.xml": "1eb3b065c55895e347308e50cd717dee",
".idea/web.iml": "52db5efd0fe9f576a1302b8c4b5eac6c",
".idea/misc.xml": "e6b023077aa4876dbe12734108325458"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
