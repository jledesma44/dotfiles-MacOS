import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, rectangle, shell } from "./utils";

const rules: KarabinerRules[] = [

  // ===Define the Hyper key itself===
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
    ],
  },

  // ===Define caps_lock to left_control if pressed with other keys and escape if pressed alone.===
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

  // ===Add sleep monitor keybinds for keyboards with out 'Eject' button===
  //                 ===Ctrl+Shfit+Esc====
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
  
// === This is the HyperSublayers section 
  ...createHyperSubLayers({
    spacebar: open(
      "raycast://extensions/stellate/mxstbr-commands/create-notion-todo"
    ),

// B = Bluetooth toggle devices ==========================

    b: {
      //toggle Jlab Go Air
      j: open("raycast://extensions/VladCuciureanu/toothpick/toggle-favorite-device-1"),
      //toggle logitech BT audio living room
      l: open("raycast://extensions/VladCuciureanu/toothpick/toggle-favorite-device-2"),
      //toggle Gees Trackpad
      m: open("raycast://extensions/VladCuciureanu/toothpick/toggle-favorite-device-3"),

    },

// C = Controls for Music p:play/pause  n:fastforward b:rewind ======================
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
   
      
//D = Display / Dismiss =============================================================     
      
    d: {
    // Display sleep / kill  
      k: open("raycast://extensions/raycast/system/sleep-displays"),
    //Dismiss Notification banner
      n: open("btt://execute_assigned_actions_for_trigger/?uuid=93543ACA-AE92-4936-A74B-5D0A894D658E"),
    },

// E = Entertainment (Music) ============================
 
    e: {
      m: app("Music"),
      n: app("Spotify"),
    },

// L = LLMs (AI applications) ==========================

    l: { 
      g: app("ChatGPT"),
      v: app("v0 by Vercel"),
      c: app("Claude"),
      r: app("RepoPrompt"),
      b: app("Bolt.gee"),     
      x: app("Perplexity"),     
      s: app("LM Studio"),     
    },

// O = "Open" applications ==============================

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
      t: app("TextEdit"),
      m: app("Messages"),
      p: app("iPhone Mirroring"),
      s: app("System Settings"),
      i: app("obsidian"),
      1: app("1Password 7"),     
      2: app("Karabiner-Elements"),
      3: app("Karabiner-EventViewer"),
      //y: app("ChatGPT"),
    },

// R = "Raycast" ==================================================================

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

// S = "System controls" =======================================

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

// V = "moVe" which isn't "m" because we want it to be on the left hand
// so that hjkl work like they do in vim ==========================================

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

// W = "Window" via rectangle.app =======================

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
      u: rectangle("next-display"),
      k: rectangle("top-half"),
      j: rectangle("bottom-half"),
      h: rectangle("left-half"),
      l: rectangle("right-half"),
      f: rectangle("maximize"),
      c: rectangle("center"),
      i: {
        description: "Window: Previous Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control", "right_shift"],
          },
        ],
      },
      o: {
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
  }),
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
