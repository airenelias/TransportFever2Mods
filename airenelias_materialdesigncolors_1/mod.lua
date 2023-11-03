local values = {}
local valuesstr = {}
for i=0,255 do
  table.insert(values, i)
  table.insert(valuesstr, tostring(i))
end

function data()
  local minorVersion = 0

  return {
    info = {
      minorVersion = minorVersion,
      severityAdd = "NONE",
      severityRemove = "NONE",
      name = _("Material Design Colors"),
      description = _("Less saturated color palette for lines and vehicles.\n"..
		"In the mod settings you can add up to 5 custom colors using RGB values.\n"..
		"\n"..
		"Based on Mr_WolfZ More Line & Vehicle Colors mod."),
      tags = { "Script Mod", "UI", "Color", "Colour" },
      authors = {
        {
          name = "Airen",
          role = 'CREATOR',
        },
      },
    },
	
    runFn = function (settings, modParams)	  
      -- the game tries to make the color chart a square if possible, adding a new column first
      -- if required, e.g. 64 colors result in an 8x8 grid, while 56 colors result in a 7x8 grid;
      -- this allows us to have 8 colors with 7 hues each

      -- first, we define the colors as RGB hex values

      local colors = {
		{
		  -- Blue Grey
          '263238',
          '37474f',
          '455a64',
          '546e7a',
          '607d8b',
          '78909c',
          '90a4ae',
          'b0bec5',
          'cfd8dc',
          'eceff1',
        },
	    {
		  -- Red
          'b71c1c',
          'd32f2f',
		  'e53935',
          'f44336',
          'e57373',
          -- Grey
          '212121',
          '616161',
		  '757575',
          '9e9e9e',
		  'e0e0e0',
        },
		{
          -- Pink
          '880e4f',
          'c2185b',
		  'd81b60',
          'e91e63',
          'f06292',
		  -- Brown
          '3e2723',
          '5d4037',
		  '6d4c41',
          '795548',
          'a1887f',
        },
		{
		  -- Purple
          '4a148c',
          '7b1fa2',
		  '8e24aa',
          '9c27b0',
          'ba68c8',
          -- Deep Orange
          'bf360c',
          'e64a19',
		  'f4511e',
          'ff5722',
          'ff8a65',
        },
		{
          -- Deep Purple
          '311b92',
          '512da8',
		  '5e35b1',
          '673ab7',
          '9575cd',
		  -- Orange
          'e65100',
          'f57c00',
		  'fb8c00',
          'ff9800',
          'ffb74d',
        },
		{
		  -- Indigo
          '1a237e',
          '303f9f',
		  '3949ab',
          '3f51b5',
          '7986cb',
          -- Amber
          'ff6f00',
          'ffa000',
		  'ffb300',
          'ffc107',
          'ffd54f',
        },
		{
          -- Blue
          '0d47a1',
          '1976d2',
		  '1e88e5',
          '2196f3',
          '64b5f6',
		  -- Yellow
          'f57f17',
          'fbc02d',
		  'fdd835',
          'ffeb3b',
          'fff176',
        },
		{
		  -- Light Blue
          '01579b',
          '0288d1',
		  '039be5',
          '03a9f4',
          '4fc3f7',
          -- Lime
          '827717',
          'afb42b',
		  'c0ca33',
          'cddc39',
          'dce775',
        },
		{
          -- Cyan
          '006064',
          '0097a7',
		  '00acc1',
          '00bcd4',
          '4dd0e1',
		  -- Light Green
          '33691e',
          '689f38',
		  '7cb342',
          '8bc34a',
          'aed581',
        },
		{
		  -- Teal
          '004d40',
          '00796b',
		  '00897b',
          '009688',
          '4db6ac',
          -- Green
          '1b5e20',
          '388e3c',
		  '43a047',
          '4caf50',
          '81c784',
        }
      }

      -- the game requires the colors to be a one-dimensional array of RGB decimals in the range 0-1;
      -- we build this array by iterating over the colors above in the correct order and transforming
      -- each hex value to the correct range
      local nrOfRows = #colors[1]
      local nrOfColumns = #colors
	  
      local lineColors = {}

      local function hexToNormalizedDecimal(hexValue)
        return tonumber(hexValue, 16) / 255
      end

      for row = 1, nrOfRows do
        for column = 1, nrOfColumns do
		  local hexValue = colors[column][row]
	      local redValue = hexToNormalizedDecimal(string.sub(hexValue, 1, 2))
		  local greenValue = hexToNormalizedDecimal(string.sub(hexValue, 3, 4))
		  local blueValue = hexToNormalizedDecimal(string.sub(hexValue, 5, 6))

          local rgb = { redValue, greenValue, blueValue }
          table.insert(lineColors, rgb)
        end
      end

      game.config.gui.lineColors = lineColors
    end,
  }
end
