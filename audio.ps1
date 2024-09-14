$audioDevice1ID = "{0.0.0.00000000}.{0b7754a7-6f6e-4b0a-9ca7-818ff2ac8709}" # Set your ID for Audio Device
$audioDevice2ID = "{0.0.0.00000000}.{f0d08825-9716-4c6c-bea7-a65e17aa2ae6}" # Set your ID for Audio Device

$currentAudio = Get-AudioDevice -Playback
if ($currentAudio.ID -eq $audioDevice1ID) {
    Set-AudioDevice -ID $audioDevice2ID
} else {
    Set-AudioDevice -ID $audioDevice1ID
}
