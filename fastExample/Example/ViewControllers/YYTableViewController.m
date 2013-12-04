//
//  YYTableViewController.m
//  Example
//
//  Created by Yuya Yaguchi on 12/2/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYTableViewController.h"
#import "YYCommentList.h"
#import "YYCommentCell.h"

@interface YYTableViewController () <YYCommentListDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, strong) YYCommentList *commentList;

@end

@implementation YYTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _commentList = [[YYCommentList alloc] initWithDelegate:self];
    [_commentList requestAsynchronous];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _commentList.count;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.comment = [_commentList commentAtIndex:indexPath.row];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    YYCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.comment = [_commentList commentAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Scroll view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentOffsetWidthWindow = self.tableView.contentOffset.y + self.tableView.bounds.size.height;
    BOOL leachToBottom = contentOffsetWidthWindow >= self.tableView.contentSize.height;
    if (!leachToBottom || _commentList.loading) return;
    [_indicator startAnimating];
    [_commentList requestMoreAsynchronous];
}

#pragma mark - Comment List delegate

- (void)commentListDidLoad
{
    [_indicator stopAnimating];
    [self.tableView reloadData];
}

@end
