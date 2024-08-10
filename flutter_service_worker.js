'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "8793f7fa7f39dc1fe853db699c82b021",
"version.json": "8f4ba40dc85334acb035e82a22a9464a",
"index.html": "4487771a5a74043c6890837692f3eb03",
"/": "4487771a5a74043c6890837692f3eb03",
"main.dart.js": "9b313a19f6592f76a048160a1234d947",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "005d3a5b8a61c1cbbd2dd07c9c30ea3f",
"icons/Icon-192.png": "c58659b872c83f49a7f78140e21a2d6c",
"icons/Icon-maskable-192.png": "c58659b872c83f49a7f78140e21a2d6c",
"icons/Icon-maskable-512.png": "9b3b1b9d24a7d20ecb52d496c816da21",
"icons/Icon-512.png": "9b3b1b9d24a7d20ecb52d496c816da21",
"manifest.json": "661d7413bd0b2c17cd8cde37cbe35601",
".git/config": "6e5184e15a446dae28f426c9bade1f45",
".git/objects/60/6924621b1a7d82a73185d887cec9425bc1d05f": "d0a93855f0797332a72103847a56a22d",
".git/objects/d6/ebd4805981b8400db3e3291c74a743fef9a824": "6c33f0e88a71d9ba8563eab3ee932f04",
".git/objects/c7/461d24f73ed8d01dc7c64e7c5a0d40a84b9d9a": "f7610b0fb43d1a33e85dd57ff470df5b",
".git/objects/f5/89ca37d210990980a9d9b1a5cb4a29d2db6c70": "8b8d21aac8e6cdbec1fc106163311c31",
".git/objects/28/8b36b1efb71c411d5c27a1ea6c08e41a7fed46": "58a717c6109371969d37342fdb8e534d",
".git/objects/26/d33521af10bcc7fd8cea344038eaaeb78d0ef5": "39554bb11371007e021a7fb3361ecd47",
".git/objects/5d/7f76b4aa0febacaa28954f99b5db7fd1ac9f13": "07ca302b4fb5e61684417ab37b89ffb7",
".git/objects/06/bd4e2db062d570651649a01ede9eb13676cc27": "9fbcfeefb99a0b58c7e357ffefa69550",
".git/objects/6c/0b8635858dc7ad44b93df54b762707ce49eefc": "4301997f66617848371b4f6ad8aeafc1",
".git/objects/d3/cd223459ad80770e495d1a081ef75c002e3ba4": "ccba17a4d8f40c6cd9ed52674c7f283c",
".git/objects/dc/370e86e1f96e62c0283bb4048c4a1d0db3960d": "9d957c619a5c7ea304d10a8cc3125721",
".git/objects/a6/e1098c7d41cd3fc6fcb1019225d2e52e5a1c75": "99b806776f34ca9dabf4ee23895a7a93",
".git/objects/f7/e1cf73143893f1b7b482d526c7e54764ee8b74": "d602327832f911dcd4027dc56c3b70bb",
".git/objects/f1/c42e4df5408962d78c7c6c5bad977dd2364bb9": "ca6d91391663eda409ae21e0e7bf53f9",
".git/objects/2d/75d80e4c2648aef072be5aae8d97b433cfa911": "f9ae5185977005bcd3585d7c908cd9be",
".git/objects/15/eef5f9b1c0c1a208b800dfaadb29181a9225af": "b351a961c6d94586ba764dda943aa3e2",
".git/objects/2b/01f817581621255ce4eb6f9d6d464437c8e4a5": "b7440613f545af87dd9f9afd900e03e2",
".git/objects/7a/a2332ac4a340c73cfebd1eb17737efd24259f7": "1addb3727adfc5a4285e48181b466c5b",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "e4d2ca1cd3c3b72cf48ff8b75464972b",
".git/logs/refs/heads/main": "e4d2ca1cd3c3b72cf48ff8b75464972b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "9c0c852f66c28b0ef54ad4ee2ab657a4",
".git/index": "7fee4de45e3a60dabfe61e4b068895b7",
".git/COMMIT_EDITMSG": "00ad00ea711905a384f300494fd9cd0a",
"assets/AssetManifest.json": "01494938b6709bffad281767f9bc0849",
"assets/NOTICES": "a378f8ff433a77a4a8d06f8a97b345e7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "3b823bfcf6250f0127a0c5c5ad600a43",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2c5b4032a1f1ea83171eae7ee2e62133",
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
"assets/assets/images/dzap_bg.png": "9bc46de744ea02017251347e0d6ff635",
"assets/assets/images/propel_bg.png": "be8efb963ea7e922708832e662bc4e83",
"assets/assets/images/bg.png": "3aaa71bae0330b323baba4ac01fe0c17",
"assets/assets/pdf/aparna_chatterjee.pdf": "3737c4e993dc9cb09bc81e005ef2ffad",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
".idea/vcs.xml": "55b7e3c95c188fd86e7ecc8c360934b1",
".idea/workspace.xml": "ca6a55581882f76c5d5d1ee198b7e94b",
".idea/modules.xml": "1eb3b065c55895e347308e50cd717dee",
".idea/web.iml": "52db5efd0fe9f576a1302b8c4b5eac6c",
".idea/misc.xml": "f460225ee7b0da88b858fdafab5eca69"};
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
