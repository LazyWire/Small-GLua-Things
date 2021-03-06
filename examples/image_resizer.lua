local HtmlCode = [[
<script>
  function imageResize(img, w, h) {
    var canvas = document.createElement('canvas'),
    ctx = canvas.getContext('2d');

    canvas.width = w;
    canvas.height = h;

    ctx.drawImage(img, 0, 0, w, h);

    return canvas.toDataURL();
  }

  var img = new Image;
  img.onload = function() {
    gmod.callback(imageResize(this, %s, %s));
  };
  img.src = %q;		
</script>
]]

local sub_len = #"data:image/png;base64," + 1

function util.ResizeImage(url, w, h, callback) -- also u can download materials from http hosts with that solution :D
	local HTML = vgui.Create("DHTML")
	HTML:AddFunction("gmod", "callback", function(img)
		callback(util.Base64Decode(img:sub(sub_len)))
		HTML:Remove()
	end)
	HTML:SetHTML(HtmlCode:format(w, h, url))
end
