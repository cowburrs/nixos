lockPref("browser.startup.page", 3);
lockPref("layout.css.prefers-color-scheme.content-override", 0);
lockPref("browser.quitShortcut.disabled", true);
lockPref("sidebar.verticalTabs", true);
lockPref("browser.profiles.enabled", false); // Does nothing basically
lockPref("general.autoScroll", true);
lockPref("browser.tabs.closeWindowWithLastTab", false);

// AI......
lockPref("browser.ml.enable", false); // general switch for machine learning features in Firefox (https://www.reddit.com/r/firefox/comments/1obbrvz/how_to_completely_get_rid_of_the_ai_stuff/nki10g9/), though it might not completely disable all features (https://bugzilla.mozilla.org/show_bug.cgi?id=1971973#c11)
lockPref("browser.ml.chat.enabled", false); // AI Chatbot (https://docs.openwebui.com/tutorials/integrations/firefox-sidebar/#additional-about-settings)
lockPref("browser.ml.chat.sidebar", false);
lockPref("browser.ml.chat.menu", false); // remove "Ask a chatbot" from tab context menu
lockPref("browser.ml.chat.page", false); // remove option from page context menu
lockPref("extensions.ml.enabled", false); // might only be relevant for app developers
lockPref("browser.ml.linkPreview.enabled", false);
lockPref("browser.ml.pageAssist.enabled", false);
lockPref("browser.ml.smartAssist.enabled", false);
lockPref("browser.tabs.groups.smart.enabled", false); // "Use AI to suggest tabs and a name for tab groups" in settings
lockPref("browser.tabs.groups.smart.userEnabled", false);
lockPref("pdfjs.enableAltTextModelDownload", false); // "This prevents downloading the AI model unless the user opts in (by enabling the toggle to "Create alt text automatically" from "Image alt text settings" when viewing a PDF)"
lockPref("pdfjs.enableGuessAltText", false); // (disabling this might be redundant when AltTextModelDownload is disabled)
