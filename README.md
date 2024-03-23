# BariKoi Map with Autocomplete - Flutter Project
## Screenshots
| | | |
|---|---|---|
| ![Image 1](https://pub-025eba96160d45eb8b4d209ff55bfdc6.r2.dev/Screenshot_2024-03-23-15-41-38-124_com.task.barikoi.safi.jpg) | ![Image 2](https://pub-025eba96160d45eb8b4d209ff55bfdc6.r2.dev/New%20folder%20(2)%2FScreenshot_2024-03-23-15-41-28-127_com.task.barikoi.safi.jpg) | ![Image 3](https://pub-025eba96160d45eb8b4d209ff55bfdc6.r2.dev/New%20folder%20(2)%2FScreenshot_2024-03-23-15-40-16-725_com.task.barikoi.safi.jpg) |
| ![Image 4](https://pub-025eba96160d45eb8b4d209ff55bfdc6.r2.dev/New%20folder%20(2)%2FScreenshot_2024-03-23-15-40-28-426_com.task.barikoi.safi.jpg) | ![Image 5](https://pub-025eba96160d45eb8b4d209ff55bfdc6.r2.dev/New%20folder%20(2)%2FScreenshot_2024-03-23-15-40-33-120_com.task.barikoi.safi.jpg) | ![Image 6](https://pub-025eba96160d45eb8b4d209ff55bfdc6.r2.dev/New%20folder%20(2)%2FScreenshot_2024-03-23-15-41-12-998_com.task.barikoi.safi.jpg) |

## Run
### Edit .env file
- Create a new file named `.env` in the root directory of the project.
- Add the following content to the `.env` file, replacing `<HOST>` with the Bari Koi API host and `<YOUR_KEY>` with your Bari Koi API key.
``` env copy
# https://barikoi.xyz/v2/api
BARIKOI_HOST_API=<HOST>

BARIKOI_API_KEY=<YOUR_KEY>
```
### Generate Code
Run the following command in the terminal to generate necessary code.

``` shell copy
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run the Application
Once you've completed the setup steps, you can run the Flutter project.
``` shell copy
flutter run
```
