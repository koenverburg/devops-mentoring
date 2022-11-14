/** @type {import('next').NextConfig} */

const repo = "devops-mentoring";

const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  assetPrefix: `/${repo}/`,
  basePath: `/${repo}`,
  images: {
    unoptimized: true,
  },
};

module.exports = nextConfig;
