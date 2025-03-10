import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, rectangle, shell } from "./utils";

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Tab -> Hyper Key",
        from: {
          key_code: "tab",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              name: "hyper",
              value: 1,
            },
          },
        ],
        to_after_key_up: [
          
          {
            set_variable: {
              name: "hyper",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "tab",
          },
        ],
        type: "basic",
      },
      //      {
      //        type: "basic",
      //        description: "Disable CMD + Tab to force Hyper Key usage",
      //        from: {
      //          key_code: "tab",
      //          modifiers: {
      //            mandatory: ["left_command"],
      //          },
      //        },
      //        to: [
      //          {
      //            key_code: "tab",
      //          },
      //        ],
      //      },
    ],
  },
  {
    "description": "Change caps_lock to control if pressed with other keys, to escape if pressed alone.",
    "manipulators": [
      {
          "from": {
              "key_code": "caps_lock",
              "modifiers": { "optional": ["any"] }
          },
          "to": [{ "key_code": "left_control" }],
          "to_if_alone": [{ "key_code": "escape" }],
          "type": "basic"
      }
    ] 
  },
  // Add sleep monitor for keyboard with out eject button
  {
    "description": "Ctrl+Cmd+Shift+Esc to Sleep Monitor",
    "manipulators": [
      {
        "from": {
          "key_code": "escape",
          "modifiers": {
            "mandatory": [
              "left_control",
              "left_shift"
            ]
          }
        },
        "to": [
          {
          "key_code": "eject",
            "modifiers": [
              "left_control",
              "left_shift"
            ]
          }
        ],
        "type": "basic"
      }
    ]
  },
  
  ...createHyperSubLayers({
    spacebar: open(
      "raycast://extensions/stellate/mxstbr-commands/create-notion-todo"
    ),
    // b = "B"luetooth toggle devices
    b: {
      //toggle Jlab Go Air
      j: open("raycast://extensions/VladCuciureanu/toothpick/toggle-favorite-device-1"),
      //toggle logitech BT audio living room
      l: open("raycast://extensions/VladCuciureanu/toothpick/toggle-favorite-device-2"),
      //toggle Gees Trackpad
      m: open("raycast://extensions/VladCuciureanu/toothpick/toggle-favorite-device-3"),

      y: open("https://news.ycombinator.com"),
      f: open("https://facebook.com"),
      r: open("https://reddit.com"),
    },
    // q = Entertainment (Music)
    q: {
      m: app("Music"),
      s: app("Spotify"),
    },
    // l = LLMs (AI applications)
    l: { 
      g: app("ChatGPT"),
      v: app("v0 by Vercel"),
      c: app("Claude"),
      r: app("RepoPrompt"),
      b: app("Bolt.gee"),     
      x: app("Perplexity"),     
      s: app("LM Studio"),     
    },
    // o = "Open" applications
    o: {
      g: app("Google Chrome"),
      f: app("Firefox"),
      d: app("Firefox Developer Edition"),
      r: app("Safari"),
      a: app("Arc"),
      k: app("kitty"),
      c: app("Visual Studio Code"),
      h: app("Figma"),
      v: app("VNC Viewer"),
      n: app("Parallels Desktop"),
      z: app("Final Cut Pro"),
      x: app("OBS"),
      e: app("Finder"),
      u: app("Calculator"),
      l: app("Karabiner-Elements"),
      t: app("TextEdit"),
      m: app("Messages"),
      p: app("iPhone Mirroring"),
      s: app("System Settings"),
      i: app("obsidian"),
      //b: app("bolt.gee"),     
      //y: app("ChatGPT"),
      //l: open(
      //  "raycast://extensions/stellate/mxstbr-commands/open-mxs-is-shortlink"
      //),
    },

    // TODO: This doesn't quite work yet.
    // l = "Layouts" via Raycast's custom window management
    // l: {
    //   // Coding layout
    //   c: shell`
    //     open -a "Visual Studio Code.app"
    //     sleep 0.2
    //     open -g "raycast://customWindowManagementCommand?position=topLeft&relativeWidth=0.5"

    //     open -a "Terminal.app"
    //     sleep 0.2
    //     open -g "raycast://customWindowManagementCommand?position=topRight&relativeWidth=0.5"
    //   `,
    // },

    // w = "Window" via rectangle.app
    w: {
      semicolon: {
        description: "Window: Hide",
        to: [
          {
            key_code: "h",
            modifiers: ["right_command"],
          },
        ],
      },
      y: rectangle("previous-display"),
      o: rectangle("next-display"),
      k: rectangle("top-half"),
      j: rectangle("bottom-half"),
      h: rectangle("left-half"),
      l: rectangle("right-half"),
      f: rectangle("maximize"),
      u: {
        description: "Window: Previous Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control", "right_shift"],
          },
        ],
      },
      i: {
        description: "Window: Next Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control"],
          },
        ],
      },
      n: {
        description: "Window: Next Window",
        to: [
          {
            key_code: "grave_accent_and_tilde",
            modifiers: ["right_command"],
          },
        ],
      },
      b: {
        description: "Window: Back",
        to: [
          {
            key_code: "open_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
      // Note: No literal connection. Both f and n are already taken.
      m: {
        description: "Window: Forward",
        to: [
          {
            key_code: "close_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
      d: {
        description: "Window: Next display",
        to: [
          {
            key_code: "right_arrow",
            modifiers: ["right_control", "right_option", "right_command"],
          },
        ],
      },
    },

    // s = "System controls"
    s: {
      u: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      k: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      l: {
        to: [
          {
            key_code: "q",
            modifiers: ["right_control", "right_command"],
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      semicolon: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
      e: open(
        `raycast://extensions/thomas/elgato-key-light/toggle?launchType=background`
      ),

      // "T"heme
      t: open(`raycast://extensions/raycast/system/toggle-system-appearance`),
      c: open("raycast://extensions/raycast/system/open-camera"),
      m: open("raycast://extensions/iamyeizi/toggle-menu-bar/toggle"),
    },

    // v = "moVe" which isn't "m" because we want it to be on the left hand
    // so that hjkl work like they do in vim
    v: {
      h: {
        to: [{ key_code: "left_arrow" }],
      },
      j: {
        to: [{ key_code: "down_arrow" }],
      },
      k: {
        to: [{ key_code: "up_arrow" }],
      },
      l: {
        to: [{ key_code: "right_arrow" }],
      },
      // Magicmove via homerow.app
      o: {
        to: [{ key_code: "f", modifiers: ["right_control"] }],
        // TODO: Trigger Vim Easymotion when VSCode is focused
      },
      // Scroll mode via homerow.app
      m: {
        to: [{ key_code: "j", modifiers: ["right_shift", "right_command"] }],
      },
      n: {
        to: [{ key_code: "spacebar", modifiers: ["right_shift", "right_command"] }],
      },
      u: {
        to: [{ key_code: "page_down" }],
      },
      i: {
        to: [{ key_code: "page_up" }],
        
      },
    },

    // c = Controls for Music p:play/pause  n:fastforward b:rewind 
    c: {
      p: {
        to: [{ key_code: "play_or_pause" }],
      },
      n: {
        to: [{ key_code: "fastforward" }],
      },
      b: {
        to: [{ key_code: "rewind" }],
      },
    },
   
      
    //d = Display sleep     
      
    d: {
      k: open("raycast://extensions/raycast/system/sleep-displays"),
      n: open("btt://execute_assigned_actions_for_trigger/?uuid=F280A815-6BED-494F-8B71-9A07F1CF6909"),
    },

    // r = "Raycast"
    r: {
      c: open("raycast://extensions/thomas/color-picker/pick-color"),
      n: open("raycast://script-commands/dismiss-notifications"),
      l: open(
        "raycast://extensions/stellate/mxstbr-commands/create-mxs-is-shortlink"
      ),
      e: open(
        "raycast://extensions/raycast/emoji-symbols/search-emoji-symbols"
      ),
      p: open("raycast://extensions/raycast/raycast/confetti"),
      a: open("raycast://extensions/raycast/raycast-ai/ai-chat"),
      s: open("raycast://extensions/peduarte/silent-mention/index"),
      h: open(
        "raycast://extensions/raycast/clipboard-history/clipboard-history"
      ),
      1: open(
        "raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-1"
      ),
      2: open(
        "raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-2"
      ),
    },
  }),
  // Minecraft
  {
    description: "Change Backspace to Spacebar when Minecraft is focused",
    manipulators: [
      {
        type: "basic",
        from: {
          key_code: "delete_or_backspace",
        },
        to: [
          {
            key_code: "spacebar",
          },
        ],
        conditions: [
          {
            type: "frontmost_application_if",
            file_paths: [
              "^/Users/mxstbr/Library/Application Support/minecraft/runtime/java-runtime-gamma/mac-os-arm64/java-runtime-gamma/jre.bundle/Contents/Home/bin/java$",
            ],
          },
        ],
      },
    ],
  },
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);
