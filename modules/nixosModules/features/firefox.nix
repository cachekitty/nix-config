{
  flake.nixosModules.firefox = {
    pkgs, 
    ...
  }: {
    programs.firefox.enable = true;

    preferences.keymap = {
      "SUPER + d"."f".package = pkgs.firefox;
    };

#    programs.firefox = {
#        profiles = {
#            cachekitty = {
#                isDefault = true;
#                # extensions.packages = with pkgs.nur.repo.rycee.firefox-addons; [
#                #     proton-pass
#                #     ublock-origin
#                # ];
#                settings = {
#                    # Show previous session on startup
#                    "browser.startup.page" = 3;
#                    
#                    # Remember zoom level per site
#                    "browser.zoom.siteSpecific" = true;
#
#                    # Disable first-run stuff
#                    "browser.disableResetPrompt" = true;
#                    "browser.download.panel.shown" = true;
#                    "browser.feeds.showFirstRunUI" = false;
#                    "browser.messaging-system.whatsNewPanel.enabled" = false;
#                    "browser.rights.3.shown" = true;
#                    "browser.shell.checkDefaultBrowser" = false;
#                    "browser.shell.defaultBrowserCheckCount" = 1;
#                    "browser.startup.homepage_override.mstone" = "ignore";
#                    "browser.uitour.enabled" = false;
#                    "browser.homepage_override_url" = "";
#                    "trailhead.firstrun.dedSeeAboutWelcome" = true;
#                    "browser.bookmarks.restore_default_bookmarks" = false;
#                    "browser.bookmarks.addedImportButton" = true;
#
#                    # Don't ask for download directory
#                    "browser.download.useDownloadDir" = false;
#
#                    # Security hardening
#                    "privacy.trackingprotection.enabled" = true;
#                    "dom.security.https_only_mode" = true;
#
#                    # Disable and hide Firefox account syncing
#                    "identity.fxaccounts.enabled" = false;
#
#                    # Cookie persistence behaviour
#                    "network.cookie.lifetimePolicy" = 0;
#                    "privacy.clearOnShutdown" = false;
#                    "privacy.clearOnShutdown.siteSettings" = false;
#                    "privacy.sanitize.sanitizeOnShutdown" = false;
#
#                    # Needed for proper zoom and deature behaviour - disables anti-fingerprinting zoom locking
#                    "privacy.resistFingerprinting" = false;
#
#                    # URL bar autocomplete behaviour
#                    "browser.urlbar.autoFill" = true;
#                    "browser.urlbar.dnsFirstForSingleWords" = true;
#
#                    # Enable suggestion in the search bar
#                    "browser.search.suggest.enabled" = true;
#
#                    # Disable password saving prompt
#                    "signon.rememberSignons" = false;
#                    "passwordmanager.enabled" = false;
#
#                    # Disable saving addresses prompt
#                    "extensions.formautofill.address.enabled" = false;
#                    
#                    # Disable saving payment methods prompt
#                    "extensions.formautofil.creditCards.enabled" = false;
#
#                    # Remove the "Firefox View" button/tab
#                    "browser.tabs.firefox-view" = false;
#
#                    # Disable Pocket integration (saves articles to Firefox Account)
#                    "extensions.pocket.enabled" = false;
#
#                    # Remove ads and sponsored content from new tab page
#                    "browser.newtabpage.activity-stream.showSponsored" = false;
#                    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
#
#                    # Removes sponsored content elsewhere
#                    "browser.urlbar.suggest.quicksuggest.sponsored" = false;
#
#                    # Disable news/top stories from Mozilla on new tab page
#                    "browser.newtabpage.activity-stream.feeds.system.topstories" = false;
#
#                    # (Optional additions if you want a clean new tab page)
#          
#                    # Disable highlights like recent history and bookmarks
#                    "browser.nettabpage.activity-stream.feeds.topsites" = false;
#                    "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
#                    "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
#                    "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
#                    "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
#
#                    # Disable some telemetry
#                    "app.shield.optoutstudies.enabled" = false;
#                    "browser.discovery.enabled" = false;
#                    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
#                    "browser.newtabpage.activity-stream.telemetry" = false;
#                    "browser.ping-centre.telemetry" = false;
#                    "datareporting.healthreport.service.enabled" = false;
#                    "datareporting.healthreport.uploadEnabled" = false;
#                    "datareporting.policy.dataSubmissionEnabled" = false;
#                    "datareporting.sessions.current.clean" = true;
#                    "devtools.onboarding.telemetry.logged" = false;
#                    "toolkit.telemetry.archive.enabled" = false;
#                    "toolkit.telemetry.bhrPing.enabled" = false;
#                    "toolkit.telemetry.enabled" = false;
#                    "toolkit.telemetry.firstShutdownPing.enabled" = false;
#                    "toolkit.telemetry.hybridContent.enabled" = false;
#                    "toolkit.telemetry.newProfilePing.enabled" = false;
#                    "toolkit.telemetry.prompted" = 2;
#                    "toolkit.telemetry.rejected" = true;
#                    "toolkit.telemetry.reportingpolicy.firstRun" = false;
#                    "toolkit.telemetry.server" = "";
#                    "toolkit.telemetry.shutdownPingSender.enabled" = false;
#                    "toolkit.telemetry.unified" = false;
#                    "toolkit.telemetry.unifiedIsOptIn" = false;
#                    "toolkit.telemetry.updatePing.enabled" = false;
#                };
#                search = {
#                    force = true;
#                    default = "ddg";
#                    order = [
#                        "ddg"
#                        "nix-packages"
#                        "nixos-wiki"
#                    ];
#
#                    engines = {
#                        "nix-packages" = {
#                            urls = [
#                                {
#                                    template = "https://search.nixos.org/packages?type=packages&query={searchTerms}";
#                                    params = [
#                                        {
#                                            name = "type";
#                                            value = "packages";
#                                        }
#                                        {
#                                            name = "query";
#                                            value = "{searchTerms}";
#                                        }
#                                    ];
#                                }
#                            ];
#                            icon = "https://nixos.wiki/favicon.png";
#                            definedAliases = [ "@np" ];
#                        };
#
#                        "nixos-wiki" = {
#                            urls = [
#                                { template = "https://nixos.wiki/index.php?search={searchTerms}"; }
#                            ];
#                            icon = "https://nixos.wiki/favicon.png";
#                            updateInterval = 86400000;
#                            definedAliases = [ "@nw" ];
#                        };
#
#                        ddg = {
#                            urls = [
#                                { template = "https://duckduckgo.com/?q={searchTerms}"; }
#                            ];
#                            icon = "https://duckduckgo.com/favicon.ico";
#                            definedAliases = [ "@ddg" ];
#                        };
#
#                    # Hide Bing from the UI
#                    bing.metaData.hidden = true;
#
#                    # Give Google an alias
#                    google.metaData.hidden = true;
#                };
#            };
#        };
#    };
#
#    stylix.targets.firefox.profileNames = [ "cryptbug" ];
#    stylix.enableReleaseChecks = false;
#  }; 
};
}
