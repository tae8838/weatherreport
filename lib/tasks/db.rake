namespace :db do
  desc 'recreate the database, run migrations'
  task :recreate => :environment do
    puts 'Dropping DB'
    Rake::Task['db:drop'].invoke

    puts 'Creating DB'
    Rake::Task['db:create'].invoke

    puts 'Migrating DB'
    Rake::Task['db:migrate'].invoke

    puts 'Seeding DB'
    Rake::Task['db:seed'].invoke

    puts 'Preparing Test DB'
    Rake::Task['db:test:prepare'].invoke
  end
end
