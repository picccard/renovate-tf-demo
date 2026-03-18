# Renovate terraform demo

Directory `iac` is copied from https://github.com/Azure-Samples/avm-terraform-labs/tree/main.

File `renovate.json` holds the config for renovate and signals the repository is onboarded for renovate.

Scripts `start-renovate-without-gh-token.sh` & `start-renovate-with-gh-token.sh` mounts the repo in a container and runs renovate on it.

Scripts pipe container output to files `renovate-local-without-gh-token.log` & `renovate-local-with-gh-token.log`. Check out diff between the logs in vscode or with the `diff` command.


```diff
diff --git a/renovate-local-without-gh-token.log b/renovate-local-with-gh-token.log
index 6488c78..f792d54 100644
--- a/renovate-local-without-gh-token.log
+++ b/renovate-local-with-gh-token.log
@@ -4,6 +4,7 @@ DEBUG: Using RE2 regex engine
 DEBUG: Parsing configs
 DEBUG: Checking for config file in /usr/src/app/local-repo/renovate.json
 DEBUG: No additional config file found specified - skipping
+DEBUG: Converting GITHUB_COM_TOKEN into a global host rule
 DEBUG: File config
        "config": {
          "$schema": "https://docs.renovatebot.com/renovate-schema.json",
@@ -14,14 +15,22 @@ DEBUG: Additional file config
 DEBUG: CLI config
        "config": {}
 DEBUG: Env config
-       "config": {"hostRules": [], "onboarding": false, "platform": "local"}
+       "config": {
+         "hostRules": [
+           {"hostType": "github", "matchHost": "github.com", "token": "***********"}
+         ],
+         "onboarding": false,
+         "platform": "local"
+       }
 DEBUG: Resolved global extends
        "config": undefined
 DEBUG: Combined config
        "config": {
          "$schema": "https://docs.renovatebot.com/renovate-schema.json",
          "extends": ["config:recommended"],
-         "hostRules": [],
+         "hostRules": [
+           {"hostType": "github", "matchHost": "github.com", "token": "***********"}
+         ],
          "onboarding": false,
          "platform": "local"
        }
@@ -29,15 +38,18 @@ DEBUG: Enabling forkProcessing while in non-autodiscover mode
 DEBUG: Enabling onboardingNoDeps while in non-autodiscover mode
 DEBUG: Found valid git version: 2.53.0
 DEBUG: Setting global hostRules
+DEBUG: Adding token authentication for github.com (hostType=github) to hostRules
 DEBUG: Using baseDir: /tmp/renovate
 DEBUG: Using cacheDir: /tmp/renovate/cache
 DEBUG: Using containerbaseDir: /tmp/renovate/cache/containerbase
 DEBUG: Initializing Renovate internal cache into /tmp/renovate/cache/renovate/renovate-cache-v1
 DEBUG: Commits limit = null
 DEBUG: Setting global hostRules
+DEBUG: Adding token authentication for github.com (hostType=github) to hostRules
 DEBUG: validatePresets()
 DEBUG: Reinitializing hostRules for repo
 DEBUG: Clearing hostRules
+DEBUG: Adding token authentication for github.com (hostType=github) to hostRules
  INFO: Repository started (repository=local)
        "renovateVersion": "43.76.2"
 DEBUG: Using localDir: /usr/src/app (repository=local)
@@ -219,7 +231,7 @@ DEBUG: preflight content check has not found any relevant content (repository=lo
 DEBUG: preflight content check has not found any relevant content (repository=local, packageFile=local-repo/iac/part04-storage-account/variables.tf)
 DEBUG: preflight content check has not found any relevant content (repository=local, packageFile=local-repo/iac/part05-virtual-machine/variables.tf)
 DEBUG: manager extract durations (ms) (repository=local)
-       "managers": {"terraform": 125}
+       "managers": {"terraform": 103}
 DEBUG: Found terraform package files (repository=local)
 DEBUG: Found 47 package file(s) (repository=local)
  INFO: Dependency extraction complete (repository=local)
@@ -227,8 +239,8 @@ DEBUG: Found 47 package file(s) (repository=local)
          "managers": {"terraform": {"fileCount": 47, "depCount": 67}},
          "total": {"fileCount": 47, "depCount": 67}
        }
- WARN: GitHub token is required for some dependencies (repository=local)
-       "githubDeps": ["hashicorp/terraform"]
+DEBUG: hostRules: authentication already set for api.github.com (repository=local)
+DEBUG: Using queue: host=api.github.com, concurrency=16 (repository=local)
 DEBUG: hostRules: no authentication for registry.terraform.io (repository=local)
 DEBUG: Using queue: host=registry.terraform.io, concurrency=16 (repository=local)
 DEBUG: PackageFiles.add() - Package file saved for base branch (repository=local)
@@ -390,9 +402,14 @@ DEBUG: packageFiles with updates (repository=local)
                  "depName": "hashicorp/terraform",
                  "extractVersion": "v(?<version>.*)$",
                  "versioning": "hashicorp",
-                 "skipReason": "github-token-required",
                  "updates": [],
-                 "packageName": "hashicorp/terraform"
+                 "packageName": "hashicorp/terraform",
+                 "warnings": [],
+                 "sourceUrl": "https://github.com/hashicorp/terraform",
+                 "registryUrl": "https://github.com",
+                 "currentVersion": "1.14.7",
+                 "currentVersionTimestamp": "2026-03-11T14:14:31.000Z",
+                 "currentVersionAgeInDays": 6
                },
                {
                  "depType": "provider",
@@ -664,9 +681,14 @@ DEBUG: packageFiles with updates (repository=local)
                  "depName": "hashicorp/terraform",
                  "extractVersion": "v(?<version>.*)$",
                  "versioning": "hashicorp",
-                 "skipReason": "github-token-required",
                  "updates": [],
-                 "packageName": "hashicorp/terraform"
+                 "packageName": "hashicorp/terraform",
+                 "warnings": [],
+                 "sourceUrl": "https://github.com/hashicorp/terraform",
+                 "registryUrl": "https://github.com",
+                 "currentVersion": "1.14.7",
+                 "currentVersionTimestamp": "2026-03-11T14:14:31.000Z",
+                 "currentVersionAgeInDays": 6
                },
                {
                  "depType": "provider",
@@ -1046,9 +1068,14 @@ DEBUG: packageFiles with updates (repository=local)
                  "depName": "hashicorp/terraform",
                  "extractVersion": "v(?<version>.*)$",
                  "versioning": "hashicorp",
-                 "skipReason": "github-token-required",
                  "updates": [],
-                 "packageName": "hashicorp/terraform"
+                 "packageName": "hashicorp/terraform",
+                 "warnings": [],
+                 "sourceUrl": "https://github.com/hashicorp/terraform",
+                 "registryUrl": "https://github.com",
+                 "currentVersion": "1.14.7",
+                 "currentVersionTimestamp": "2026-03-11T14:14:31.000Z",
+                 "currentVersionAgeInDays": 6
                },
                {
                  "depType": "provider",
@@ -1548,9 +1575,14 @@ DEBUG: packageFiles with updates (repository=local)
                  "depName": "hashicorp/terraform",
                  "extractVersion": "v(?<version>.*)$",
                  "versioning": "hashicorp",
-                 "skipReason": "github-token-required",
                  "updates": [],
-                 "packageName": "hashicorp/terraform"
+                 "packageName": "hashicorp/terraform",
+                 "warnings": [],
+                 "sourceUrl": "https://github.com/hashicorp/terraform",
+                 "registryUrl": "https://github.com",
+                 "currentVersion": "1.14.7",
+                 "currentVersionTimestamp": "2026-03-11T14:14:31.000Z",
+                 "currentVersionAgeInDays": 6
                },
                {
                  "depType": "provider",
@@ -2175,9 +2207,14 @@ DEBUG: packageFiles with updates (repository=local)
                  "depName": "hashicorp/terraform",
                  "extractVersion": "v(?<version>.*)$",
                  "versioning": "hashicorp",
-                 "skipReason": "github-token-required",
                  "updates": [],
-                 "packageName": "hashicorp/terraform"
+                 "packageName": "hashicorp/terraform",
+                 "warnings": [],
+                 "sourceUrl": "https://github.com/hashicorp/terraform",
+                 "registryUrl": "https://github.com",
+                 "currentVersion": "1.14.7",
+                 "currentVersionTimestamp": "2026-03-11T14:14:31.000Z",
+                 "currentVersionAgeInDays": 6
                },
                {
                  "depType": "provider",
@@ -2194,44 +2231,53 @@ DEBUG: packageFiles with updates (repository=local)
        }
 DEBUG: detectSemanticCommits() (repository=local)
 DEBUG: semanticCommits: returning "disabled" from cache (repository=local)
-DEBUG: repository problems (repository=local)
-       "repoProblems": ["⚠️ WARN: GitHub token is required for some dependencies"]
 DEBUG: Repository timing splits (milliseconds) (repository=local)
-       "splits": {"init": 319, "onboarding": 0, "extract": 290, "lookup": 1344, "update": 0},
-       "total": 1963
+       "splits": {"init": 312, "onboarding": 0, "extract": 255, "lookup": 3190, "update": 0},
+       "total": 3758
 DEBUG: Package cache statistics (repository=local)
-       "get": {"count": 19, "avgMs": 8, "medianMs": 1, "maxMs": 45, "totalMs": 149},
-       "set": {"count": 19, "avgMs": 4, "medianMs": 3, "maxMs": 13, "totalMs": 75}
+       "get": {"count": 21, "avgMs": 4, "medianMs": 1, "maxMs": 16, "totalMs": 77},
+       "set": {"count": 21, "avgMs": 8, "medianMs": 2, "maxMs": 78, "totalMs": 159}
 DEBUG: Datasource cache statistics (repository=local)
        "terraform-provider": {"https://registry.terraform.io": {"hit": 0, "miss": 0, "set": 0, "skip": 4}},
-       "terraform-module": {"https://registry.terraform.io": {"hit": 0, "miss": 0, "set": 0, "skip": 14}}
+       "terraform-module": {"https://registry.terraform.io": {"hit": 0, "miss": 0, "set": 0, "skip": 14}},
+       "github-releases": {"https://github.com": {"hit": 0, "miss": 0, "set": 0, "skip": 1}}
 DEBUG: HTTP statistics (repository=local)
        "hosts": {
+         "api.github.com": {
+           "count": 5,
+           "reqAvgMs": 524,
+           "reqMedianMs": 528,
+           "reqMaxMs": 664,
+           "queueAvgMs": 0,
+           "queueMedianMs": 0,
+           "queueMaxMs": 0
+         },
          "registry.terraform.io": {
            "count": 19,
-           "reqAvgMs": 156,
-           "reqMedianMs": 153,
-           "reqMaxMs": 205,
+           "reqAvgMs": 168,
+           "reqMedianMs": 157,
+           "reqMaxMs": 310,
            "queueAvgMs": 0,
            "queueMedianMs": 0,
            "queueMaxMs": 1
          }
        },
-       "requests": 19
+       "requests": 24
 DEBUG: HTTP cache statistics (repository=local)
 DEBUG: Lookup statistics (repository=local)
-       "terraform-provider": {"count": 13, "avgMs": 78, "medianMs": 12, "maxMs": 322, "totalMs": 1016},
-       "terraform-module": {"count": 44, "avgMs": 81, "medianMs": 23, "maxMs": 286, "totalMs": 3569}
+       "terraform-provider": {"count": 13, "avgMs": 93, "medianMs": 15, "maxMs": 424, "totalMs": 1203},
+       "terraform-module": {"count": 44, "avgMs": 79, "medianMs": 7, "maxMs": 316, "totalMs": 3465},
+       "github-releases": {"count": 5, "avgMs": 2101, "medianMs": 2173, "maxMs": 2807, "totalMs": 10503}
 DEBUG: Cache fallback URLs (repository=local)
        "count": 0,
        "hits": {}
 DEBUG: Git operations statistics (repository=local)
  INFO: Repository finished (repository=local)
        "cloned": undefined,
-       "durationMs": 1963,
+       "durationMs": 3758,
        "result": undefined,
        "status": undefined,
        "enabled": undefined,
        "onboarded": undefined
 DEBUG: Checking file package cache for expired items
-DEBUG: Deleted 0 of 19 file cached entries in 14ms
+DEBUG: Deleted 0 of 21 file cached entries in 23ms
```