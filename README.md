# Info

This FiveM script allows you to recover or delete a vehicle using its license plate. It was initially created as a temporary fix for a bug in **okokGarage** and **AdvancedParking**. The issue arose when an admin used the "dv" command to delete a vehicle, causing it to neither be stored in the garage nor appear in the impound. As a result, it became impossible to park the vehicle in or out.

This Script is a Custom Barkeeper script by me. Originaly it was made because Job Creator by Jacksam did not have the Features i needed.
Originaly it was also made for the Fiv3Devs Bahamas Mamas but you can change the Coordinates, Products and Peds as you wish.


# Changelog

None

# Installation

## Dependencies

- qb-core
- qb-management (version before they moved the Company funds to qb-banking)
- qb-target (can be changed if advanced user)
- ox_lib
- ox_inventory (can be changed if advanced user

## Setup

1. **Download** the script files.
2. **Install** the required dependencies.
3. **Add** the script to your `resources` folder.
4. **Start** the script in your `server.cfg` file by adding the following line:
   ```plaintext
   ensure rpr_barkeeper
   ```
5. **Restart** your FiveM server.

## Usage


- Ensure you put the right job in the `config.lua`
- Go to the Coordinates where your Barkeeper is positionated and press ALT to open the Menu



## Notes
- 0.00ms - 0.01ms Resmon when idle

## Troubleshooting

If you encounter issues:
- Verify that all dependencies are properly installed.
- Check the server and client logs for error messages.
- Ensure that the script is correctly referenced in your `server.cfg` file.

## Contribution

Feel free to contribute by submitting issues or pull requests. For any questions or suggestions, please open an issue on the [GitHub repository](https://github.com/your-repo-link).

## License

This script is licensed under the a Custom License [LICENSE](LICENSE).

© 141Reaper
