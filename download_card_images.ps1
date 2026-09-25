$cardSearches = @{
    "de-dote" = "Dragonic Overlord the End (D Series)"
    "de-do" = "Dragonic Overlord (D Series)"
    "de-burning-horn" = "Burning Horn Dragon (D Series)"
    "de-nehalem" = "Dragon Knight, Nehalem (D Series)"
    "de-halbr" = "Dragritter, Halbr"
    "de-bahr" = "Embodiment of Armor, Bahr (D Series)"
    "de-shenryu" = "Dragon Partner, Shenryu"
    "de-sentinel" = "Flare Veil Dragon"
    "de-conroe" = "Lizard Runner, Conroe (D Series)"
    "de-crit-1" = "Blazing Dragon, Redburn"
    "de-crit-2" = "Spark Edge Dragon"
    "de-draw-1" = "Dragritter, Zafar"
    "de-heal-1" = "Dragon Monk, Genjo (D Series)"
    "de-over-1" = "Burning Flamma, Dragon of Hope"
    "de-order-regalis" = "Gratias Gradale"
    "ks-rezael" = "Fated One of Miracles, Rezael"
    "ks-bastion-prime" = "Apex Limiter, Bastion Prime"
    "ks-bastion" = "Apex Ruler, Bastion"
    "ks-blaster-blade" = "Blaster Blade (D Series)"
    "ks-fort" = "Knight of Heavenly Sword, Fort"
    "ks-marron" = "Little Sage, Marron (D Series)"
    "ks-wingal" = "Wingal (D Series)"
    "ks-crit-1" = "Blade Feather Dragon"
    "ks-heal-1" = "Healer of Heavenly Bow"
    "ks-over-1" = "Spiritual King of Determination, Olbaria"
    "ds-chronojet" = "Chronojet Dragon (D Series)"
    "ds-nextage" = "Chronodragon Nextage (D Series)"
    "ds-swirler" = "Brainwash Swirler"
    "ds-over-1" = "Star Deity of Destructive Fire, Golgoguda"
    "bg-welstra" = "Operate Master, Welstra"
    "bg-over-1" = "Star-Eater, Eldobreath"
    "st-magnolia" = "Sylvan Horned Beast King, Magnolia"
    "st-over-1" = "Source Dragon of Blessings, Blessfavor"
}

if (!(Test-Path "public\cards")) {
    New-Item -ItemType Directory -Force -Path "public\cards" | Out-Null
}

$imageMap = @{}

foreach ($pair in $cardSearches.GetEnumerator()) {
    $id = $pair.Key
    $searchTerm = $pair.Value
    $targetFile = "public\cards\$id.png"
    
    Write-Host "Processing $id ($searchTerm)..."
    
    try {
        # 1. OpenSearch to find best page title
        $searchUri = "https://cardfight.fandom.com/api.php?action=opensearch&search=" + [Uri]::EscapeDataString($searchTerm) + "&format=json"
        $searchRes = Invoke-RestMethod -Uri $searchUri -Headers @{"User-Agent"="Mozilla/5.0"} -TimeoutSec 10
        
        $titles = $searchRes[1]
        $bestTitle = $null
        foreach ($t in $titles) {
            if ($t -notmatch 'Card Lores|Card Trivia|Card Gallery|Decklist|Character|Data') {
                $bestTitle = $t
                break
            }
        }
        if (!$bestTitle -and $titles.Count -gt 0) {
            $bestTitle = $titles[0]
        }
        
        if ($bestTitle) {
            $imageUri = "https://cardfight.fandom.com/api.php?action=imageserving&wisTitle=" + [Uri]::EscapeDataString($bestTitle) + "&format=json"
            $imgRes = Invoke-RestMethod -Uri $imageUri -Headers @{"User-Agent"="Mozilla/5.0"} -TimeoutSec 10
            $imgUrl = $imgRes.image.imageserving
            
            if ($imgUrl) {
                Write-Host "   Downloading $bestTitle -> $targetFile"
                Invoke-WebRequest -Uri $imgUrl -OutFile $targetFile -Headers @{"User-Agent"="Mozilla/5.0"}
                $imageMap[$id] = "/cards/$id.png"
                continue
            }
        }
    } catch {
        Write-Host "   Failed API search for $id : $($_.Exception.Message)"
    }
    
    # Fallback to local high quality card render or existing if failed
    if (Test-Path $targetFile) {
        $imageMap[$id] = "/cards/$id.png"
    }
    Start-Sleep -Milliseconds 200
}

$imageMap | ConvertTo-Json | Set-Content "card_images_map.json"
Write-Host "Done! Downloaded $($imageMap.Count) images."
