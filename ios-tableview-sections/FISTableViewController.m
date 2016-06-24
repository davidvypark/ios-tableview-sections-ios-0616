//
//  FISTableViewController.m
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISTableViewController.h"

@interface FISTableViewController ()

@end

@implementation FISTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FISStudent *homeboy = [[FISStudent alloc] init];
    homeboy.name = @"Homeboy";
    homeboy.favoriteThings = @[@"Thing1", @"Thing2"];
    
    FISStudent *homegirl = [[FISStudent alloc] init];
    homegirl.name = @"Homegirl";
    homegirl.favoriteThings = @[@"Thang1", @"Thang2",@"Thang3"];
    
    FISStudent *horatio = [[FISStudent alloc] init];
    horatio.name = @"Horatio";
    horatio.favoriteThings = @[@"Jack-In-The-Box",@"Curly Fries"];
    
    
    self.students = @[homeboy, homegirl, horatio];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.students count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    FISStudent *currentStudent = self.students[section];
    return [currentStudent.favoriteThings count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    FISStudent *currentStudent = self.students[section];
    return currentStudent.name;
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
    
    FISStudent *currentStudent = self.students[indexPath.section];
    cell.textLabel.text = currentStudent.favoriteThings[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
