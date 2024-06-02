'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "bf63c17d5b9b9f5301ec789be653ba80",
"version.json": "8f4ba40dc85334acb035e82a22a9464a",
"index.html": "4411ee386542e1f401a19dd057b6fee4",
"/": "4411ee386542e1f401a19dd057b6fee4",
"CNAME": "020e3b2451f2afa8693629e211fabb15",
"main.dart.js": "e7453398c9f65f6d04f03cb3fe4c0e33",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "005d3a5b8a61c1cbbd2dd07c9c30ea3f",
"icons/Icon-192.png": "c58659b872c83f49a7f78140e21a2d6c",
"icons/Icon-maskable-192.png": "c58659b872c83f49a7f78140e21a2d6c",
"icons/Icon-maskable-512.png": "9b3b1b9d24a7d20ecb52d496c816da21",
"icons/Icon-512.png": "9b3b1b9d24a7d20ecb52d496c816da21",
"manifest.json": "661d7413bd0b2c17cd8cde37cbe35601",
".git/ORIG_HEAD": "208459b4e0e2d48e872eb479d07d0be3",
".git/config": "cb41ceb4201e012ea93a6f317d65ac4e",
".git/objects/0d/b09cfeb8f415cc666b4fac07ab75c148cbf304": "0a864c97b4ba3ea5483934fbfe7843d1",
".git/objects/59/e65868b685916bdcdb9cd482a90f25ec08500e": "ebdf53dbc7a0a41a3dfffdcd6f1b9273",
".git/objects/35/f3a21a4af58c2144918e66429f16b0a5411aa7": "9f4643e3313786abcd4828a135a03c14",
".git/objects/35/f29f07396ab7daaffcbcad112aed06b329806a": "eb916c087015294452454a7cc4de35ab",
".git/objects/56/e8d43d6c51fbfc5b5f718eb1eb0319a1ab7a9a": "3627b0ca8bd95e4722b48812ddd881b8",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/0e/fc7dd078f3334b1d5bde14b86ed891358579af": "7751434e6d6f353bd4c0550f2f4e3b51",
".git/objects/60/6924621b1a7d82a73185d887cec9425bc1d05f": "d0a93855f0797332a72103847a56a22d",
".git/objects/d9/933d3780deb9047edb081d21491f0866e8ae57": "d25e6fc4a3cf97d9c3ee7bf08e603b5b",
".git/objects/d0/f64965f20c5a4e6a0eb4265105b6633bb0746c": "00c5acc8c70dca41367e6a0e9b0145eb",
".git/objects/df/fa23a88b912c84b1451896913cfe4b20d92d48": "ecdfd00ba865dbf52b48ba9669b2fe72",
".git/objects/a2/fb2863394c7e21eed0218aa9e9302d0809d0ff": "389a0ecef3d8dd55ded31b151d52ecfc",
".git/objects/d6/ebd4805981b8400db3e3291c74a743fef9a824": "6c33f0e88a71d9ba8563eab3ee932f04",
".git/objects/ae/695e2c11bd8bc0f65cb6e9ff0e3b615bac0012": "3ffdb8866ec58962293231f008f9aa71",
".git/objects/d8/1854a25c3d1b3a521ee445d76457e295d4d5dd": "c77dad8e12b10c8f9ee78d4967ae8dd7",
".git/objects/f3/894355b9570f4c8d521ea52bc790d95f5a68f2": "a07fe3c4e83fceed97e32e064566ca89",
".git/objects/c9/9232739281deda90d16ab69862a78685ef8e6b": "67518fb3bf3dc7b60893380426157c34",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/e47033a6b2a5f02ac0b059c7e6b75608a25785": "8c3eabb21067ae9df0e389a6aec29886",
".git/objects/f5/89ca37d210990980a9d9b1a5cb4a29d2db6c70": "8b8d21aac8e6cdbec1fc106163311c31",
".git/objects/f5/010cda95492006dae3638dfb01a8d0822a1e6a": "04eb9fcdf209b67f396e5ab84cb956e2",
".git/objects/ca/6a2d3dce36c49da87b5e1fb63869d346cbfe40": "d16b267c53c78dab463fe5b22e242b12",
".git/objects/e4/f3361770b8b32dbd0a62f789016c4e7e9d4025": "6da983075992acebfebe3ff5a1d75f45",
".git/objects/fe/cfe27077550901d8c8d4f18300c0dda1380eaa": "7a929a13e7e9fd084e02f6d800dd7950",
".git/objects/fb/5c1df6f4ff5df74487a05e07da71c31ffd63d5": "071d34e7b68f90fcbddc56d4b4501dd7",
".git/objects/20/92d5920c61144699c44847f98ebf324c889d72": "9402f2a821bb2e45fe418e4f899e2190",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/pack/pack-58bb147d8bfdbfa788a16c32dfcd2148b7aac4e3.pack": "553b6e80c9bcf8231e9b06d5a540c01c",
".git/objects/pack/pack-58bb147d8bfdbfa788a16c32dfcd2148b7aac4e3.idx": "0e0d4fce17697bdc1df77eb128b2605b",
".git/objects/16/0071f4f189286e3acf818751bda2f002daf40e": "5afa4063655c54f735303accd6b00937",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/8f/c76df520100fc4fecd5518f06c375d96e26526": "dbe3e1b2e5e29ecdb37decc83115a316",
".git/objects/26/d33521af10bcc7fd8cea344038eaaeb78d0ef5": "39554bb11371007e021a7fb3361ecd47",
".git/objects/5d/15fadf1864d70c7184fca7d3efde79cdf68af5": "79a44d8578cc18e3add64aa6a97f0da0",
".git/objects/31/4befa0bbc8a199b6871ad0a9f69ff1d40bb673": "02752400542ce2aac5161af52e15966c",
".git/objects/62/5a1082d45bcda211b66770d5539bb99cf52fbd": "927ec2e3d8944e88482c6d1031e64b46",
".git/objects/06/bd4e2db062d570651649a01ede9eb13676cc27": "9fbcfeefb99a0b58c7e357ffefa69550",
".git/objects/39/1a47c332db258b64631d8df9432c7a0fdcb2e7": "6bb911aa1bb196cc65608ecfc3fb9c31",
".git/objects/39/eb713b3bfcbb82f7dbad73d30e8d67892c539e": "b9c069cf60cd58102d5a2b25d52b4d9d",
".git/objects/97/124cb4d22784b189186c9dc2b1840f98fba620": "3cdafdb8b2c3cfe6f5cf9e63b224c4e4",
".git/objects/63/9900d13c6182e452e33a3bd638e70a0146c785": "488924a8ec51457535ebf377a60e23c8",
".git/objects/63/80e11c775363eaa2c64861b5e7a50e5909ca93": "6cc4bca0fb45b6c12e087ed3fe9c37ae",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/b1/f1f2a62186357c17520efb21833a835a64be45": "39325571b1706b32653f62fead75977f",
".git/objects/dc/d0c2c64ebabe6f93dc355d9d8b790162b8fee2": "718684d3852151bafafdd1e56ebac826",
".git/objects/dc/f10a389b9c502d326f3865db26684de20d8a87": "52183c767c90d69f4e8b6a9d3d789d44",
".git/objects/a9/4040f992299b0d43f655f20d1f5035f527f9e2": "f300d4d19469470f498b06b6693e89e3",
".git/objects/d5/d6953da084838ee4d61c9dbfa1ba6aef412621": "b07a6386b23a81245c1f24f90894ee5f",
".git/objects/d5/2d5fe80103b4d32c46fa58db593ebb5f9b81f9": "ddd396637c09dfdfd17585f0c0b24fe3",
".git/objects/d5/00a0349a667f49f243ef1a4c188da13955357d": "7f19dffa780fa8ef0d5e8614dd9d8fbe",
".git/objects/aa/aa711dc2e0c6d7062cf5f2c78cf2794ce1d303": "ad03d15c875d3b80ab0cf388e6f04308",
".git/objects/b7/0fc960a41416406a144752ba65fb60e8d0cb8e": "da3128eb6ec3eeb9db9000e50ee1dcf4",
".git/objects/a6/5e45e1653f5765072ba0af55ebf8e50c0751b4": "347edfbf77c07e5e6ed90d3143d6e3fc",
".git/objects/c4/642086e8c369658be8fee0b0d109f87242588f": "c9a872e57be9000c116d8a93606e77ec",
".git/objects/cd/dd965a4611331f2488072a7f15eabeba571639": "7322b7e35bd020537e05395008f173b2",
".git/objects/cc/fa31771c9c9b1147308558b83d5ace89427c58": "bf0d051729e3ac2fc67b3c82c39394dd",
".git/objects/f7/164d5467862d114a21be6cc2ef825f5ce1b04e": "105bcaf6048376ecee106b49958cc15f",
".git/objects/f7/e1cf73143893f1b7b482d526c7e54764ee8b74": "d602327832f911dcd4027dc56c3b70bb",
".git/objects/ff/5dba1d02d28d11d2afa1240666b70d5d12fbd3": "6ef5e24615f785eb768899f42516ebe0",
".git/objects/e9/0aa954e4da5ebf509e04d3580de30ed73adc25": "5cfcaa82088f6ceb2ff107960990758c",
".git/objects/cb/3c54283304efd63c89f80fb6741f7f05e9e7e2": "19102647b8ad5445ecb4a426c61207e1",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/84/6781c2930f2ab7bb326979f086e9a6de488ce8": "673c72f286a4ec5803362770f8dabcfb",
".git/objects/4a/d9f1287002a23736034ca1a71881becf40d735": "462a93cfc1b4c62b401f802e79f28aa2",
".git/objects/85/7bc8c6ff8d2d714cf7a5b3af114de3c0c12c07": "bca8d02a4ff570888d2ffb7e1304cfde",
".git/objects/85/bc155ef20b83f2cdd977d84683811a21718446": "10b2ebd3d3129bc8b5ca95fe2e2dcc49",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/49/82435e18d6db3b1127121644a19824a92e0e2c": "eec514805753021463d8c05eec6f464a",
".git/objects/2b/01f817581621255ce4eb6f9d6d464437c8e4a5": "b7440613f545af87dd9f9afd900e03e2",
".git/objects/47/26bcad350ad917ac113212c8fcb6b314592d64": "516379cac540f77f083d9834bd14d118",
".git/objects/78/5ff7ff682852414c26ee3651ac9c0688858e4c": "0ff88dd9bdd1bd60bd656b67079fe589",
".git/objects/8b/4a2c8575fd89d5eefd352984d89112aa6ecd83": "cdfb150e73dcd632392800b577ef0dce",
".git/objects/13/6e2158accdd5ee3dba0625c2e29c9ed7b2c244": "38c2d732419cdbe869456bc9451581f8",
".git/objects/7a/a2332ac4a340c73cfebd1eb17737efd24259f7": "1addb3727adfc5a4285e48181b466c5b",
".git/objects/7a/e82137c9531807b90d0167ea15a80ae8535bf1": "98be4928e22e433afe8ba2384f72f590",
".git/objects/7a/371c98802e952ce96465e954579dddd3b8961a": "7c22444f5ff1fd89271dfc261fdbc4a4",
".git/objects/8e/0c3e4b9992c6ba5352118c73a15f39cfa2b4e3": "8f6123b11e6eb1fcdb8d23ed945c2824",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/HEAD": "0af9d79d3865a5c83cab051e7b80a0fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "65b4bea1e242eac524e562bf5271895b",
".git/logs/refs/heads/deploy_3": "455c59dcca2cb711b19dd99684827a2c",
".git/logs/refs/heads/main": "7a3b47e01c9ce15a1b938fc1660e6e2c",
".git/logs/refs/remotes/by-aparna.github.io/deploy_3": "91a74b7cde8a8570d12fe4a301ebf0fa",
".git/logs/refs/remotes/by-aparna.github.io/deploy_2": "3a9ce337f8ddd7ec102ef63fc8e2f0d1",
".git/logs/refs/remotes/by-aparna.github.io/main": "55c21b7583f491a4dba7ccad28a3af0f",
".git/logs/refs/remotes/by-aparna.github.io/test_2": "336ebc36f1a5ff1d0293351830af3467",
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
".git/refs/heads/deploy_3": "82c10360ad98f63ed5dc685dfb6c3a50",
".git/refs/heads/main": "208459b4e0e2d48e872eb479d07d0be3",
".git/refs/remotes/by-aparna.github.io/deploy_3": "82c10360ad98f63ed5dc685dfb6c3a50",
".git/refs/remotes/by-aparna.github.io/deploy_2": "4717461c03f5e92284b00cc9e361d0cb",
".git/refs/remotes/by-aparna.github.io/main": "583d43a2dcc26401e0d3b34e93378a54",
".git/refs/remotes/by-aparna.github.io/test_2": "4ac5aec113ab5794e81b9e3e7fd060ca",
".git/index": "62bfb1aa571c8297e995a2c674de7965",
".git/COMMIT_EDITMSG": "934f99c2e7051850d1830f67cf040f9b",
".git/FETCH_HEAD": "4023b7125b124a249a5973138310a7fe",
"assets/AssetManifest.json": "01494938b6709bffad281767f9bc0849",
"assets/NOTICES": "16d1333fe1ec757f15a6f078ba1e135a",
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
".idea/vcs.xml": "166acef3d301bd241d0d6da15bc5ad3c",
".idea/workspace.xml": "148be8a4d37f1914e505b0c8f1925e9d",
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
