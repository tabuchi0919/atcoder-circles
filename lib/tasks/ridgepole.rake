# frozen_string_literal: true

namespace :ridgepole do
  desc 'ridgepole --apply'
  task apply: :environment do
    ridgepole! '--apply'
    Rake::Task['db:schema:dump'].invoke
  end

  desc 'ridgepole --apply --dry-run'
  namespace :apply do
    task 'dry-run' => :environment do
      ridgepole! '--apply', '--dry-run'
    end
  end

  private

  def schemafile
    Rails.root.join('schemafile.rb')
  end

  def configfile
    Rails.root.join('config', 'database.yml')
  end

  def ridgepole!(*args)
    system "bundle exec ridgepole #{[options + args].join(' ')}"
  end

  def options
    ["-E #{Rails.env}", "-c #{configfile}", "-f #{schemafile}"]
  end
end
