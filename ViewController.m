//
//  ViewController.m
//  StaticTableView
//
//  Created by raul on 08/10/2024.
//

#import "ViewController.h"
#import "CountryTable.h"
#import "LiveActions.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *staticTable;
@property (nonatomic, assign) BOOL isAdditionalCellVisible;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBackgroundColor];

    self.title = @"BHTikTok++ Settings";
    self.staticTable = [[UITableView alloc] initWithFrame:CGRectZero ];
    self.staticTable.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.staticTable];
    [NSLayoutConstraint activateConstraints:@[
        [self.staticTable.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.staticTable.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.staticTable.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.staticTable.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
    self.staticTable.dataSource = self;
    self.staticTable.delegate = self;
    self.staticTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(regionSelected:)
                                                 name:@"RegionSelectedNotification"
                                               object:nil];
}
- (void)regionSelected:(NSNotification *)notification {
    [self.staticTable reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6; // We'll have only one section
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"Feed";
        case 1:
            return @"Profile";
        case 2:
            return @"Confirm";
        case 3:
            return @"Other";
        case 4:
            return @"Region";
            break;
        case 5:
            return @"Live Button Function";
        default:
            break;
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: // Feed section
            return 15; // The number of items in the Feed array
        case 1: // Profile section
            return 4; // The number of items in the Profile array
        case 2: // Confirm section
            return 4; // The number of items in the Confirm array
        case 3: // Other section
            return 9; // The number of items in the Other array
        case 4:
            return 2;
        case 5:
            return 2;
        default:
            return 0; // Fallback for unexpected section
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                return [self createSwitchCellWithTitle:@"Hide Ads"
                                                  Detail:@"Hide all ads from the app"
                                                    Key:@"hide_ads"];
            case 1:
                return [self createSwitchCellWithTitle:@"Download Button"
                                                  Detail:@"Enable download button for videos"
                                                    Key:@"download_button"];
            case 2:
                return [self createSwitchCellWithTitle:@"Share Sheet"
                                                  Detail:@"Enable sharing options in share sheet"
                                                    Key:@"share_sheet"];
            case 3:
                return [self createSwitchCellWithTitle:@"Remove Watermark"
                                                  Detail:@"Remove the TikTok watermark from videos"
                                                    Key:@"remove_watermark"];
            case 4:
                return [self createSwitchCellWithTitle:@"Show/Hide UI Button"
                                                  Detail:@"Show or hide the UI button"
                                                    Key:@"remove_elements_button"];
            case 5:
                return [self createSwitchCellWithTitle:@"Stop Playback"
                                                  Detail:@"Stop video playback automatically"
                                                    Key:@"stop_play"];
            case 6:
                return [self createSwitchCellWithTitle:@"Auto Play Next Video"
                                                  Detail:@"Automatically play the next video"
                                                    Key:@"auto_play"];
            case 7:
                return [self createSwitchCellWithTitle:@"Show Progress Bar"
                                                  Detail:@"Display progress bar on video playback"
                                                    Key:@"show_porgress_bar"];
            case 8:
                return [self createSwitchCellWithTitle:@"Transparent Comments"
                                                  Detail:@"Make comments transparent"
                                                    Key:@"transparent_commnet"];
            case 9:
                return [self createSwitchCellWithTitle:@"Show Usernames"
                                                  Detail:@"Display usernames on videos"
                                                    Key:@"show_username"];
            case 10:
                return [self createSwitchCellWithTitle:@"Disable Sensitive Content"
                                                  Detail:@"Disable sensitive content filter"
                                                    Key:@"disable_unsensitive"];
            case 11:
                return [self createSwitchCellWithTitle:@"Disable Warnings"
                                                  Detail:@"Disable TikTok warnings"
                                                    Key:@"disable_warnings"];
            case 12:
                return [self createSwitchCellWithTitle:@"Disable Live Streaming"
                                                  Detail:@"Disable live video streaming"
                                                    Key:@"disable_live"];
            case 13:
                return [self createSwitchCellWithTitle:@"Skip Recommendations"
                                                  Detail:@"Skip recommended videos"
                                                    Key:@"skip_recommnedations"];
            case 14:
                return [self createSwitchCellWithTitle:@"Upload Region"
                                                  Detail:@"Show Upload Region Flag Next to Username"
                                                    Key:@"upload_region"];
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                return [self createSwitchCellWithTitle:@"Profile Save"
                                                  Detail:@"Save profile details to clipboard"
                                                    Key:@"save_profile"];
            case 1:
                return [self createSwitchCellWithTitle:@"Profile Copy"
                                                  Detail:@"Copy profile information"
                                                    Key:@"copy_profile_information"];
            case 2:
                return [self createSwitchCellWithTitle:@"Video Like Count"
                                                  Detail:@"Show the number of likes on videos"
                                                    Key:@"video_like_count"];
            case 3:
                return [self createSwitchCellWithTitle:@"Video Upload Date"
                                                  Detail:@"Show the date videos were uploaded"
                                                    Key:@"video_upload_date"];
            default:
                break;
        }
    } else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                return [self createSwitchCellWithTitle:@"Like Confirmation"
                                                  Detail:@"Confirm before liking a video"
                                                    Key:@"like_confirm"];
            case 1:
                return [self createSwitchCellWithTitle:@"Like Comment Confirmation"
                                                  Detail:@"Confirm before liking a comment"
                                                    Key:@"like_comment_confirm"];
            case 2:
                return [self createSwitchCellWithTitle:@"Dislike Comment Confirmation"
                                                  Detail:@"Confirm before disliking a comment"
                                                    Key:@"dislike_comment_confirm"];
            case 3:
                return [self createSwitchCellWithTitle:@"Follow Confirmation"
                                                  Detail:@"Confirm before following a user"
                                                    Key:@"follow_confirm"];
            default:
                break;
        }
    } else if (indexPath.section == 3) {
        switch (indexPath.row) {
            case 0:
                return [self createSwitchCellWithTitle:@"Always Open Safari"
                                                  Detail:@"Always open links in Safari"
                                                   Key:@"openInBrowser"];
            case 1:
                return [self createSwitchCellWithTitle:@"Enable Fake Changes"
                                                  Detail:@"Enable fake profile changes"
                                                    Key:@"en_fake"];
            case 2: {
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
                UILabel *followerLabel = [[UILabel alloc] init];
            followerLabel.text = @"Follower:";
            followerLabel.font = [UIFont systemFontOfSize:16];
            followerLabel.translatesAutoresizingMaskIntoConstraints = NO; // Enable Auto Layout
            [cell.contentView addSubview:followerLabel];
            
            // Create the UITextField for entering text
            UITextField *textField = [[UITextField alloc] init];
            textField.placeholder = @"Enter follower count";
            textField.borderStyle = UITextBorderStyleRoundedRect;
            textField.delegate = self;
            textField.tag = 2;
            textField.returnKeyType = UIReturnKeyDone;
            textField.translatesAutoresizingMaskIntoConstraints = NO; // Enable Auto Layout
            [cell.contentView addSubview:textField];
            
            // Set constraints for UILabel and UITextField
            [NSLayoutConstraint activateConstraints:@[
                // Constraints for followerLabel
                [followerLabel.leadingAnchor constraintEqualToAnchor:cell.contentView.leadingAnchor constant:15],
                [followerLabel.centerYAnchor constraintEqualToAnchor:cell.contentView.centerYAnchor],
                [followerLabel.widthAnchor constraintEqualToConstant:100], // Fixed width for the label
                
                // Constraints for textField
                [textField.leadingAnchor constraintEqualToAnchor:followerLabel.trailingAnchor constant:10],
                [textField.trailingAnchor constraintEqualToAnchor:cell.contentView.trailingAnchor constant:-15],
                [textField.centerYAnchor constraintEqualToAnchor:cell.contentView.centerYAnchor],
                [textField.heightAnchor constraintEqualToConstant:30] // Fixed height for the text field
            ]];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *savedText = [defaults stringForKey:@"following_count"];
            if (savedText) {
                textField.text = savedText;
            }
            
            return cell;
            }
            case 3: {
                       // Create a new cell
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

                // Create the UILabel for "Following:"
                UILabel *followingLabel = [[UILabel alloc] init];
                followingLabel.text = @"Following:";
                followingLabel.font = [UIFont systemFontOfSize:16];
                followingLabel.translatesAutoresizingMaskIntoConstraints = NO; // Enable Auto Layout
                [cell.contentView addSubview:followingLabel];

                // Create the UITextField for entering text
                UITextField *textField = [[UITextField alloc] init];
                textField.placeholder = @"Enter following count";
                textField.borderStyle = UITextBorderStyleRoundedRect;
                textField.delegate = self;
                textField.tag = 1;
                textField.returnKeyType = UIReturnKeyDone;
                textField.translatesAutoresizingMaskIntoConstraints = NO; // Enable Auto Layout
                [cell.contentView addSubview:textField];

                // Set constraints for UILabel and UITextField
                [NSLayoutConstraint activateConstraints:@[
                    // Constraints for followingLabel
                    [followingLabel.leadingAnchor constraintEqualToAnchor:cell.contentView.leadingAnchor constant:15],
                    [followingLabel.centerYAnchor constraintEqualToAnchor:cell.contentView.centerYAnchor],
                    [followingLabel.widthAnchor constraintEqualToConstant:100], // Fixed width for the label
                    
                    // Constraints for textField
                    [textField.leadingAnchor constraintEqualToAnchor:followingLabel.trailingAnchor constant:10],
                    [textField.trailingAnchor constraintEqualToAnchor:cell.contentView.trailingAnchor constant:-15],
                    [textField.centerYAnchor constraintEqualToAnchor:cell.contentView.centerYAnchor],
                    [textField.heightAnchor constraintEqualToConstant:30] // Fixed height for the text field
                ]];

                // Load saved text from NSUserDefaults
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                NSString *savedText = [defaults stringForKey:@"following_count"];
                if (savedText) {
                    textField.text = savedText;
                }

                return cell;
            }
            case 4:
                return [self createSwitchCellWithTitle:@"Fake Verified"
                                                  Detail:@"Make your account appear verified"
                                                    Key:@"fake_verify"];
            case 5:
                return [self createSwitchCellWithTitle:@"Extended Bio"
                                                  Detail:@"Extend bio section of your profile"
                                                    Key:@"extended_bio"];
            case 6:
                return [self createSwitchCellWithTitle:@"Extended Comments"
                                                  Detail:@"Extend the length of your comments"
                                                    Key:@"extendedComment"];
            case 7:
                return [self createSwitchCellWithTitle:@"Upload HD"
                                                  Detail:@"Upload videos in HD quality"
                                                    Key:@"upload_hd"];
            case 8:
                return [self createSwitchCellWithTitle:@"App Lock"
                                                  Detail:@"Lock the app with a passcode"
                                                    Key:@"padlock"];
            default:
                break;
        }
    } else if (indexPath.section == 4) {
        switch (indexPath.row) {
            case 0:
                return [self createSwitchCellWithTitle:@"Enable Region Changing"
                                                Detail:@"Enable region changing functionality"
                                                   Key:@"en_region"];
            case 1: {
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                UITableViewCell *regions = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
                regions.textLabel.text = @"Regions";
                NSDictionary *selectedRegion = [defaults dictionaryForKey:@"region"];
                regions.detailTextLabel.text = [NSString stringWithFormat:@"%@", selectedRegion[@"area"]];
                return regions;
            }
            default:
                break;
        }
    } else if (indexPath.section == 5) {
        switch (indexPath.row) {
            case 0:
                return [self createSwitchCellWithTitle:@"Live Button Action"
                                                Detail:@"Change The Default Live Button Action"
                                                   Key:@"en_livefunc"];
            case 1: {
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                UITableViewCell *liveAction = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
                liveAction.textLabel.text = @"Actions";
                NSString *selectedLiveAction = [defaults valueForKey:@"live_action"];
                liveAction.detailTextLabel.text = [NSString stringWithFormat:@"%@", selectedLiveAction];
                return liveAction;
            }
                break;
            default:
                break;
        }
    }
    return [UITableViewCell new]; // Fallback if no match
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected row at index: %ld", (long)indexPath.section);
    if (indexPath.section == 4 && indexPath.row == 1){
        CountryTable *countryTable = [[CountryTable alloc] init];
        [self presentViewController:countryTable animated:YES completion:nil];
    }
    else if (indexPath.section == 5 && indexPath.row == 1){
        LiveActions *liveActions = [[LiveActions alloc] init];
        [self presentViewController:liveActions animated:YES completion:nil];
    }
}

- (UITableViewCell *)createSwitchCellWithTitle:(NSString *)title Detail:(NSString*)detail Key:(NSString*)key {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

    
    UISwitch *switchView = [[UISwitch alloc] init];
    [cell.contentView addSubview:switchView];
    cell.accessoryView = switchView;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    switchView.on = [defaults boolForKey:key];
    switchView.accessibilityLabel = key;
    [switchView addTarget:self action:@selector(switchToggled:) forControlEvents:UIControlEventValueChanged];
    

    // Configure the switch (optional)
    switchView.onTintColor = [UIColor greenColor];
    switchView.thumbTintColor = [UIColor whiteColor];
    
    // Set the cell's text label (optional)
    cell.textLabel.text = title;
    cell.detailTextLabel.text = detail;  // Set the description text
    cell.detailTextLabel.textColor = [UIColor grayColor];
    return cell;
    
}

- (void)switchToggled:(UISwitch *)sender {
    
    NSString *key = sender.accessibilityLabel;
    
    // Save the switch state to NSUsesrDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:sender.isOn forKey:key];
    [defaults synchronize];
//    [self.staticTable beginUpdates];
//        if (sender.isOn) {
//            // Insert the additional cell
//            [self.staticTable insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:4]]
//                                  withRowAnimation:UITableViewRowAnimationAutomatic];
//        } else {
//            // Delete the additional cell
//            [self.staticTable deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:4]]
//                                  withRowAnimation:UITableViewRowAnimationAutomatic];
//        }
//    [self.staticTable endUpdates];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 1){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:textField.text forKey:@"following_count"];
        [defaults synchronize];
    } else if (textField.tag == 2){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:textField.text forKey:@"follower_count"];
        [defaults synchronize]; 
    }


}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
