# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)

---

**Vercel deployment (frontend + backend)**

Follow these steps to deploy the app and backend on Vercel.

1. Create a Vercel account and install the Vercel CLI (optional):

```bash
npm i -g vercel
# then login
vercel login
```

2. In the Vercel dashboard, create a new Project and import this repository. Set the project root to the repository root.

3. Environment variables (Backend). In the Vercel project settings -> Environment Variables, add the following for both `Preview` and `Production` as appropriate:

- `DB_HOST` — your MySQL host
- `DB_USER` — your MySQL user
- `DB_PASSWORD` — your MySQL password
- `DB_NAME` — your database name
- `JWT_SECRET` — a long random secret for signing tokens
- `FRONTEND_ORIGIN` — your frontend URL (e.g. `https://your-project.vercel.app`)

You can also add them with the Vercel CLI (example):

```bash
vercel env add DB_HOST production
vercel env add DB_USER production
vercel env add DB_PASSWORD production
vercel env add DB_NAME production
vercel env add JWT_SECRET production
vercel env add FRONTEND_ORIGIN production
```

4. This repository is configured for a single Vercel project using `vercel.json`:
	- Frontend: static build from `package.json` (`npm run build`).
	- Backend: server wrapper at `/api` that forwards to the Express app in `sole-spectrum-backend`.

5. Deploy using the Vercel dashboard or CLI:

```bash
# from repo root
vercel --prod
```

After deploy, verify:

- Visit your frontend URL (e.g. `https://your-project.vercel.app`).
- Test an API endpoint: `https://your-project.vercel.app/api/products` (you may need auth for some endpoints).

If you prefer separate Vercel projects for frontend and backend, create two projects and set the backend project root to `sole-spectrum-backend` (use its existing `vercel.json`).
