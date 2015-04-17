require 'spec_helper'

describe 'sendmail::mc::daemon_options' do
  let(:title) { 'foo' }

  # :id and :osfamily facts are needed for concat module
  let(:facts) do
    {
      :id              => 'stm',
      :osfamily        => 'Debian',
      :operatingsystem => 'Debian',
      :concat_basedir  => '/tmp',
    }
  end

  context 'with default arguments' do
    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument family => inet' do
    let(:params) do
      { :family => 'inet' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, Family=inet'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument family => inet6' do
    let(:params) do
      { :family => 'inet6' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, Family=inet6'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with illegal argument family' do
    let(:params) do
      { :family => 'foobar' }
    end

    it do
      expect {
        should compile
      }.to raise_error(/does not match/)
    end
  end

  context 'with argument delivery_mode => background' do
    let(:params) do
      { :delivery_mode => 'background' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=b'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument delivery_mode => b' do
    let(:params) do
      { :delivery_mode => 'b' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=b'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument delivery_mode => deferred' do
    let(:params) do
      { :delivery_mode => 'deferred' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=d'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument delivery_mode => d' do
    let(:params) do
      { :delivery_mode => 'd' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=d'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument delivery_mode => interactive' do
    let(:params) do
      { :delivery_mode => 'interactive' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=i'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument delivery_mode => i' do
    let(:params) do
      { :delivery_mode => 'i' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=i'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument delivery_mode => queueonly' do
    let(:params) do
      { :delivery_mode => 'queueonly' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=q'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument delivery_mode => q' do
    let(:params) do
      { :delivery_mode => 'q' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, DeliveryMode=q'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument addr => localhost' do
    let(:params) do
      { :addr => 'localhost' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, Addr=localhost'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument port => smtp' do
    let(:params) do
      { :port => 'smtp' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, Port=smtp'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument port => 25' do
    let(:params) do
      { :port => '25' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, Port=25'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end

  context 'with argument family => inet and port => 25' do
    let(:params) do
      { :family => 'inet', :port => '25' }
    end

    it do
      should contain_concat__fragment('sendmail_mc-daemon_options-foo') \
              .with_content(/^DAEMON_OPTIONS\(`Name=foo, Family=inet, Port=25'\)dnl$/) \
              .with_order('60') \
              .that_notifies('Class[sendmail::makeall]')
    end
  end
end