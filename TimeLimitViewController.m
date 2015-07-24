//
//  TimeLimitViewController.m
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "TimeLimitViewController.h"
#import "LimitCellModel.h"
#import "LimitTableViewCell.h"

@interface TimeLimitViewController ()<UISearchResultsUpdating>
{
    UITableView *_tableView;
    UISearchController *_searchController; //搜索栏
    NSMutableData *_data;
    NSMutableData *_recevierData; //请求获取的数据
    NSMutableArray *_dataList; //数据源列表
    NSMutableArray *_modelList; //模型列表
    NSURLConnection *_urlConnection; //请求的连接
    NSMutableArray *_searchList;  //搜索结果列表
    NSInteger _page; //当前请求的页数
}
@end

#define kReuseIdentifier @"cellId"

//限免页面

@implementation TimeLimitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _recevierData = [[NSMutableData alloc] init];
    _dataList = [[NSMutableArray alloc] init];
    _modelList = [[NSMutableArray alloc] init];
    _searchList = [[NSMutableArray alloc] init];
    
    [self createDataWithPage:0];
    [self createUI];
    [self customBulidLeftButton];
    [self customBulidRightButton];
    [self customNavigationTitle:@"限免" andSize:22 andColor:[UIColor redColor]];
}
//定制navigation左右两边的button
- (void)customBulidLeftButton
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"buttonbar_action@2x"] forState:UIControlStateSelected];
    leftBtn.frame = CGRectMake(0, 0, 44, 33);
    leftBtn.tag = 100;
    [leftBtn setTitle:@"分类" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(btnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
}
- (void)customBulidRightButton
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"buttonbar_action@2x"] forState:UIControlStateSelected];
    rightBtn.frame = CGRectMake(0, 0, 44, 33);
    rightBtn.tag = 101;
    [rightBtn setTitle:@"设置" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(btnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
}
//左右按钮事件
- (void)btnItemClick:(UIButton *)button
{
    if (button.tag == 100) {
        NSLog(@"leftBtnItemClick");
    }
    else if (button.tag == 101)
    {
        NSLog(@"rightBtnItemClick");
    }
}
//自定义navigation的title 参数：标题，字体大小，字体颜色
- (void)customNavigationTitle:(NSString *)title andSize:(NSInteger)size andColor:(UIColor *)color
{
    UILabel *navTitleLabel = [[UILabel alloc] init];
    navTitleLabel.frame = CGRectMake(0, 0, 88, 44);
    navTitleLabel.backgroundColor = [UIColor clearColor];
    navTitleLabel.font = [UIFont systemFontOfSize:size];
    navTitleLabel.text = title;
    navTitleLabel.textColor = color;
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    navTitleLabel.adjustsFontSizeToFitWidth = YES;
    self.navigationItem.titleView = navTitleLabel;
}

#pragma mark --上拉加载,下拉刷新,UIScrollViewDelegate--
//下拉刷新
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < -50) {
        _page--;
        [UIView animateWithDuration:1.0 animations:^(void){
        
            //_tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
            
        } completion:^(BOOL finished){
        
            [self createDataWithPage:_page];
            //_tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        }];
    }
}
//上拉加载
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //长拉超过100个高度才算加载
    if (scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height + 100) {
        _page++;
        [UIView animateWithDuration:1.0 animations:^(void){
            _tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
        } completion:^(BOOL finished){
            
            [self createDataWithPage:_page];
            _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        }];
    }
}


//创建模型列表
- (void)initialModelListWithApps:(NSArray *)apps
{
    for (NSDictionary *app in apps) {
        LimitCellModel *model = [[LimitCellModel alloc] init];
        
        model.starCurrent = [app objectForKey:@"starCurrent"];
        model.downloads = [app objectForKey:@"downloads"];
        model.currentPrice = [app objectForKey:@"currentPrice"];
        model.lastPrice = [app objectForKey:@"lastPrice"];
        model.priceTrend = [app objectForKey:@"priceTrend"];
        model.expireDatetime = [app objectForKey:@"expireDatetime"];
        model.fileSize = [app objectForKey:@"fileSize"];
        model.shares = [app objectForKey:@"shares"];
        model.favorites = [app objectForKey:@"favorites"];
        model.version = [app objectForKey:@"version"];
        model.descrip = [app objectForKey:@"description"];
        model.releaseDate = [app objectForKey:@"releaseDate"];
        model.name = [app objectForKey:@"name"];
        model.applicationId = [app objectForKey:@"applicationId"];
        model.slug = [app objectForKey:@"slug"];
        model.iconUrl = [app objectForKey:@"iconUrl"];
        
        
        [_modelList addObject:model];
    }
}


//创建数据源
- (void)createDataWithPage:(NSInteger)page
{
    NSString *urlString = [NSString stringWithFormat:@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%ld",page];
    NSURL *url = [NSURL URLWithString:urlString];
    /**--------数据请求三部曲---------**/
    //创建一个请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    //连接 -->异步请求方式  创建一个连接:由连接对象创建一个新的线程，帮助去下载
    _urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    //响应
}
#pragma mark --NSURLConnectionDataDelegate数据请求--
//收到响应将原来的数据源置为空
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _recevierData.length = 0;
}
//接受到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //追加数据
    [_recevierData appendData:data];
}
//异步加载的一个特点，即其他函数都已经执行完了，但是都不一定能有数据
//数据接收完
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //解析数据
    id result = [NSJSONSerialization JSONObjectWithData:_recevierData options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        //字典类型
        NSArray *applications = [result objectForKey:@"applications"];
        //初始化数据模型
        [self initialModelListWithApps:applications];
        //保存源数据
        [_dataList addObjectsFromArray:applications];
    }
    else if ([result isKindOfClass:[NSArray class]])
    {
        //数组类型
    }
    [_tableView reloadData];
}

//创建UI
- (void)createUI
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.separatorColor = [UIColor purpleColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //创建搜索栏UI
    //initWithSearchResultsController表示在当前的view上显示结果
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.searchBar.placeholder = @"名称、分享次数搜索";
    _searchController.searchResultsUpdater = self;
    
    CGRect frame = _searchController.searchBar.frame;
    frame.size.height = 44;
    _searchController.searchBar.frame = frame;
    _tableView.tableHeaderView = _searchController.searchBar;
    

    [self.view addSubview:_tableView];
}
#pragma mark --UISearchResultUpdating--
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [_searchList removeAllObjects];
    NSString *searchString = searchController.searchBar.text;
    for (int i=0; i<_modelList.count; i++) {
        LimitCellModel *model = [_modelList objectAtIndex:i];
        //根据名字查找
        if ([model.name containsString:searchString]) {
            [_searchList addObject:model];
        }
        if ([model.shares containsString:searchString]) {
            [_searchList addObject:model];
        }
        
    }
    [_tableView reloadData];
}

#pragma mark --UITableViewDataSource--
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_searchController.active) {
        return _searchList.count;
    }
    return _modelList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LimitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
    if (!cell) {
        cell = [[LimitTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kReuseIdentifier];
    }
    if (_searchController.active)
    {
        LimitCellModel *model = [_searchList objectAtIndex:indexPath.row];
        [cell showLimitCell:model];
    }
    else
    {
        LimitCellModel *model = [_modelList objectAtIndex:indexPath.row];
        [cell showLimitCell:model];
    }
    //设置cell的风格
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
