if [ "$(getprop ro.build.version.sdk)" ] <33; then
  exit 0
fi

until [ $(resetprop sys.boot_completed) -eq 1 ]; do
  sleep 0.5s
done

rate="$(settings get global user_preferred_refresh_rate)"
height="$(settings get global user_preferred_resolution_height)"
width="$(settings get global user_preferred_resolution_width)"

cmd display set-user-preferred-display-mode "$width" "$height" "$rate"

density="$(wm density)"

if [ width -eq 1644 ] && [ height -eq 3840] && [density -ne 534]; then
  wm density 534
elif [ width -eq 1096 ] && [ height -eq 2560] && [density -ne 356]; then
  wm density 356
fi
