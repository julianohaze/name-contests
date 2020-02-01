Vote.destroy_all
Name.destroy_all
Contest.destroy_all
User.destroy_all

user_1 = User.create(email: 'samer@agilelabs.com', first_name: 'Samer', last_name: 'Buna', api_key: '4242')
user_2 = User.create(email: 'creative@mind.com', first_name: 'Creative', last_name: 'Mind', api_key: '0000')

contest_1 = Contest.create(
    code: 'free-programming-books-site',
    title: 'Free Programming Books Site',
    description: 'A list of free online programming books, categorized by languages/topics',
    status: 'draft',
    created_by: user_1.id
)
contest_2 = Contest.create(
    code: 'visualize-most-popular-tweets',
    title: 'Visualize Most Popular Tweets',
    description: 'A site to constantly visualize the most popular tweets in your stream',
    status: 'published',
    created_by: user_1.id
)
contest_3 = Contest.create(
    code: 'entrepreneurs-looknig-for-partnership',
    title: 'Interview Entrepreneurs Looking For Partnership',
    status: 'archived',
    created_by: user_1.id
)

name_1 = Name.create(
    contest: contest_1,
    label: 'RootLib',
    normalized_label: 'rootlib',
    description: 'The Root Library',
    created_by: user_2.id
)
name_2 = Name.create(
    contest: contest_1,
    label: 'The Free List',
    normalized_label: 'thefreelist',
    created_by: user_2.id
)
name_3 = Name.create(
    contest: contest_2,
    label: 'PopTweet',
    normalized_label: 'poptweet',
    created_by: user_2.id
)
name_4 = Name.create(
    contest: contest_2,
    label: 'TwitterScope',
    normalized_label: 'twitterscope',
    created_by: user_2.id
)

Vote.create(name: name_1, up: true, created_by: user_1.id)
Vote.create(name: name_1, up: true, created_by: user_2.id)
Vote.create(name: name_2, up: true, created_by: user_1.id)
Vote.create(name: name_2, up: false, created_by: user_2.id)
Vote.create(name: name_3, up: false, created_by: user_1.id)
Vote.create(name: name_3, up: false, created_by: user_2.id)
Vote.create(name: name_4, up: false, created_by: user_1.id)
Vote.create(name: name_4, up: false, created_by: user_2.id)