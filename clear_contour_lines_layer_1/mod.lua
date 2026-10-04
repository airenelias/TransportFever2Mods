function data()
  local values = {}
  for percent = 0, 100 do
    table.insert(values, tostring(percent) .. "%")
  end

  return {
    info = {
      minorVersion = 0,
      severityAdd = "NONE",
      severityRemove = "NONE",
      name = _("Clear Contour Lines Layer"),
      description = _("Makes trees transparent when contour lines layer selected"
      ),
      tags = { "Script Mod", "Graphics", "Layer" },
      params = {
        {
          key = "opacity",
          name = _("Tree opacity"),
          uiType = "SLIDER",
          values = values,
          defaultIndex = 2,
          tooltip = _("Opacity for trees in contour view"),
        },
      },
      authors = {
        {
          name = "airenelias",
          role = "CREATOR",
        },
      },
    },

    runFn = function(settings, modParams)
      local params = modParams[getCurrentModId()]
      local entityColor = game.config.gui.layers.contourLines.baseEntityColor
      entityColor[4] = params.opacity / 100
    end,
  }
end
