# [How to Find Device Metrics for Any Screen](https://medium.com/google-design/how-to-find-device-metrics-for-any-screen-62b9ad84d097)
> Calculate the right measurements for design across devices

### 6个关心的参数
1. the screen diagonal measurement,   
2. screen dimensions,   
3. aspect ratio,   
4. pixel resolution,   
5. dp (or density-independent pixel, Android’s logical pixel)   
6. the density bucket to which each device belongs

1,3,4参数获取地址:
[Pixel 4 product page](https://store.google.com/product/pixel_4_specs), 
[the GSMArena Phone Finder](https://www.gsmarena.com/search.php3?)
<!-- Copyright 2020 Google LLC.
   SPDX-License-Identifier: Apache-2.0 -->
| Screen Diagonal | Screen Dimensions | Aspect Ratio | Pixel Resolution | dp Resolution | Density Bucket |
| --------------- | ----------------- | ----------------- | ----------------- | ----------------- | ----------------- |
| `5.7"` | `~` | `19:9` | `1080×2280` | `~` | `~` |

### Finding Screen Dimensions
[an Omni Calculator page by Hanna Pamula](https://www.omnicalculator.com/other/screen-size)(diagonal measurement and an aspect ratio (AR))  
```
Width = diagonal / √(AR²+1)
Height = (AR)×Width
```
```
Width = 5.7 / √((19/9)²+1)
Width = 2.44”
Height = (19/9)×2.44
Height = 5.15”
```

### Finding dp Resolution
[Android Developers documentation on pixel density](https://developer.android.com/training/multiscreen/screendensities)  
Pixel 4: pixel resolution is 1080×2280px, ppi: 444
```
px = dp×(dpi/160)
```
```
1080 = dp×(444/160)
1080 = dp×2.775
dp = 1080/2.775
dp = 389
```
Pixel 4 XL: 537 ppi, 1440 x 3040 pixels
```
1440 = dp*(537/160)
dp = 429.05
```

### Finding the density bucket 
density qualifiers:  which Android uses to serve bitmap drawable resources in an app   

| Density Qualifier | Denisty Value | Scale | Description |
| --------------- | ----------------- | ----------------- | ----------------- |
| `ldpi` | `~120dpi` | `0.75x` | `Resources for low-density (ldpi) screens.` |
| `mdpi` | `~160dpi` | `1x` | `Resources for medium-density (mdpi) screens. (This is the baseline density.)` |
| `hdpi` | `~240dpi` | `1.5x` | `Resources for high-density (hdpi) screens.` |
| `xhdpi` | `~320dpi` | `2x` | `Resources for extra-high-density (xhdpi) screens.` |
| `xxhdpi` | `~480dpi` | `3x` | `Resources for extra-extra-high-density (xxhdpi) screens.` |
| `xxxhdpi` | `~640dpi` | `4x` | `Resources for extra-extra-extra-high-density (xxxhdpi) uses.` |
| `nodpi` | `n/a` | `n/a` | `Resources for all densities. These are density-independent resources. The system does not scale resources tagged with this qualifier, regardless of the current screen's density.` |
| `tvdpi` | `~213dpi` | `1.33x` | `Resources for screens somewhere between mdpi and hdpi; approximately 213dpi. This is not considered a "primary" density group. It is mostly intended for televisions and most apps shouldn't need it—providing mdpi and hdpi resources is sufficient for most apps and the system will scale them as appropriate. If you find it necessary to provide tvdpi resources, you should size them at a factor of 1.33*mdpi. For example, a 100px x 100px image for mdpi screens should be 133px x 133px for tvdpi.` |

Pixel 4’s ~444ppi, we would assign the XXHDPI density qualifier

<!-- Copyright 2020 Google LLC.
   SPDX-License-Identifier: Apache-2.0 -->
| Screen Diagonal | Screen Dimensions | Aspect Ratio | Pixel Resolution | dp Resolution | Density Bucket |
| --------------- | ----------------- | ----------------- | ----------------- | ----------------- | ----------------- |
| `5.7"` | `2.44×5.15` | `19:9` | `1080×2280` | `392×822dp` | `XXHDPI` |

For further reading on pixel density, layout, and how the two interact, see the [Material Design guidance on Layout](https://material.io/design/layout/understanding-layout.html#usage).
