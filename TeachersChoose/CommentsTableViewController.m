//
//  CommentsTableViewController.m
//  TeachersChoose
//
//  Created by Cooper Veysey on 4/8/15.
//  Copyright (c) 2015 ZandTheDMs. All rights reserved.
//

#import "CommentsTableViewController.h"
#import "CommentCell.h"
#import "CommentsTableView.h"
#import "Comments.h"
#import "FISDonorsChooseProposal.h"
#import "DetailsTabBarController.h"
#import "FISDonation.h"


@interface CommentsTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *commentsArray;
@property (nonatomic, strong) FISDonorsChooseProposal *proposal;

@end

@implementation CommentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100.0;
    
[self.tableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil ] forCellReuseIdentifier:@"basicCell"];

    self.commentsArray = [[NSMutableArray alloc]init];

    self.proposal=((DetailsTabBarController*)self.tabBarController).selectedProposal;
    /* setup public property (self.comments)
     and segmented control in tableHeaderView all / awaiting reply.
     awaiting data models to do more */

//    for (FISDonation *eachDonation in self.proposal.donations) {

//    Comments *newComment = [[Comments alloc]initWithDonorName:@"Anish Kumar" donorLocation:@"from NYC" donationGivenDate:[NSDate date] donorMessageCopy:@"We are proud of what you have accomplished and everything you are trying to do for your classroom. We hope this helps to meet your goals. Your children are very lucky to have such a carrying and passionate teacher!"];
   
    
    for(FISDonation *eachDonation in self.proposal.donations) {
        Comments *newComment = [[Comments alloc] initWithDonorName:eachDonation.donorName donorLocation:eachDonation.donorLocation donationGivenDate:eachDonation.donationDate donorMessageCopy:eachDonation.donorMessage];
        [self.commentsArray addObject:newComment];
    }
    

//    [self.commentsArray addObject:newComment]

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0;
}


//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {
//    
//    return 150.0;
//}

-(void)viewDidAppear:(BOOL)animated
{
    // set the title (DOESNT WORK)
    self.navigationController.navigationItem.title = @"Comments";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.commentsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    
    cell.comments = [self.commentsArray objectAtIndex:indexPath.row];
    
//        if (cell == nil)
//            {
//                cell = [CommentCell alloc] init];
//    //    }
    //
    //    FISDonation *thisDonation = self.comments[indexPath.row];
    //
    //    cell.commenterName.text = thisDonation.donor;
    //    cell.messageBody.text = thisDonation.donorMessage;
    
    return cell;
}



@end
